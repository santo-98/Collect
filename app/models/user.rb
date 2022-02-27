# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  phone_number           :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Relationships
  has_many :forms
  has_many :user_forms, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Accessors
  attr_accessor :skip_password_validation

  #  Callbacks
  after_update :update_verified, if: :encrypted_password_changed?

  def self.signup_with_email(params)
    user = User.find_by(email: params[:email])
    unless user.present?
      user = User.new(email: params[:email])
      user.skip_password_validation = true
      user.reset_password_sent_at = DateTime.now
      user.reset_password_token = Devise.friendly_token
      user.phone_number = params[:phone_number]
      user.save
    end
    user
  end

  protected
    def password_required?
      return false if skip_password_validation
      super
    end

    def update_verified
      self.user_forms.update_all(verified: true)
    end
end
