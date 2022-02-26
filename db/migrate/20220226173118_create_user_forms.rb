class CreateUserForms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_forms do |t|
      t.integer :user_id
      t.integer :form_id
      t.integer :role

      t.timestamps
    end
    add_index :user_forms, :user_id
    add_index :user_forms, :form_id
  end
end
