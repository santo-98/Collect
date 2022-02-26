# == Schema Information
#
# Table name: single_choices
#
#  id           :bigint           not null, primary key
#  description  :string(255)
#  mandatory    :boolean
#  options      :text(65535)
#  response     :string(255)
#  title        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  responder_id :integer
#
# Indexes
#
#  index_single_choices_on_responder_id  (responder_id)
#
require 'test_helper'

class SingleChoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
