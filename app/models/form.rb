# == Schema Information
#
# Table name: forms
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_forms_on_user_id  (user_id)
#
class Form < ApplicationRecord
  # Data
  QUESTION_TYPES = ["text", "single_choice", "multiple_choice"]

  # Relationships
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :user_forms, dependent: :destroy
  has_many :responses, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { maximum: 250 }

  # Callbacks
  after_create :add_admin_user_form

  private
    def add_admin_user_form
      user_form = self.user.user_forms.new(role: :admin, form_id: self.id)
      unless user_form.save
        self.errors[:base] << user_form.error_sentence
      end
    end
end
