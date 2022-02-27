class MoveResponseToResponses < ActiveRecord::Migration[5.2]
  def change
    remove_column :texts, :response
    remove_column :single_choices, :response

    add_column :responses, :response, :text
  end
end
