class RemoveQuestionId < ActiveRecord::Migration[5.2]
  def change
    remove_column :texts, :question_id
    remove_column :single_choices, :question_id

    add_column :texts, :responder_id, :integer
    add_column :single_choices, :responder_id, :integer

    add_index :texts, :responder_id
    add_index :single_choices, :responder_id
  end
end
