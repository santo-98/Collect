# == Schema Information
#
# Table name: texts
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  mandatory   :boolean
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Text < ApplicationRecord
  has_many :questions, as: :questionable

  # Validations
  validates :title, presence: true
end
