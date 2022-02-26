# == Schema Information
#
# Table name: questions
#
#  id                :bigint           not null, primary key
#  questionable_type :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  form_id           :integer
#  questionable_id   :integer
#  user_id           :integer
#
# Indexes
#
#  index_questions_on_form_id                                (form_id)
#  index_questions_on_questionable_type_and_questionable_id  (questionable_type,questionable_id) UNIQUE
#  index_questions_on_user_id                                (user_id)
#
class Question < ApplicationRecord
  # Relationships
  belongs_to :questionable, polymorphic: true, dependent: :destroy
  belongs_to :form
  belongs_to :user
end
