class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :forms, :user_id
  end
end
