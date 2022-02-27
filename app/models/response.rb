# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  responsable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  form_id          :integer
#  responsable_id   :integer
#
# Indexes
#
#  index_responses_on_form_id  (form_id)
#
class Response < ApplicationRecor
  # Relationships
  belongs_to :responsable, polymorphic: true, dependent: :destroy
  belongs_to :form
end
