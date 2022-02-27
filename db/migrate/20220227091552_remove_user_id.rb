class RemoveUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :texts, :responder_id
    remove_column :single_choices, :responder_id

    add_column :responses, :responder_id, :integer
  end
end
