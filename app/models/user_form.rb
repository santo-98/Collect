# == Schema Information
#
# Table name: user_forms
#
#  id         :bigint           not null, primary key
#  role       :integer
#  verified   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_user_forms_on_form_id  (form_id)
#  index_user_forms_on_user_id  (user_id)
#
class UserForm < ApplicationRecord
  belongs_to :user
  belongs_to :form

  enum role: [:admin, :customer]

  validates :role, inclusion: { in: roles.keys }
  validates :form_id, uniqueness: { scope: :user_id }
end
