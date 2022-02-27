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
require 'test_helper'

class SingleChoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
