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
require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
