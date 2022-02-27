# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  responsable_type :string(255)
#  response         :text(65535)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  form_id          :integer
#  responder_id     :integer
#  responsable_id   :integer
#
# Indexes
#
#  index_responses_on_form_id  (form_id)
#
class Response < ApplicationRecord
  # Relationships
  belongs_to :responsable, polymorphic: true, dependent: :destroy
  belongs_to :form
  belongs_to :responder, class_name: "User"
end
