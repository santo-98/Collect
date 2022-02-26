# == Schema Information
#
# Table name: user_forms
#
#  id         :bigint           not null, primary key
#  role       :integer
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
require 'test_helper'

class UserFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
