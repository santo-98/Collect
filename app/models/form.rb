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

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
end
