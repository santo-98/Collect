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
require 'test_helper'

class TextTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
