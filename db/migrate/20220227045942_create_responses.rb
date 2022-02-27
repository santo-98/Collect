class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :form_id
      t.string :responsable_type
      t.integer :responsable_id

      t.timestamps
    end
    add_index :responses, :form_id
  end
end
