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
  # Relationships
  belongs_to :user

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
end
