# == Schema Information
#
# Table name: single_choices
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  mandatory   :boolean
#  options     :text(65535)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SingleChoice < ApplicationRecord
  serialize :options, Array
  has_many :questions, as: :questionable

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :options, presence: true
end
