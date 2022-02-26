class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :form_id
      t.integer :user_id
      t.string :questionable_type
      t.integer :questionable_id

      t.timestamps
    end
    add_index :questions, :form_id
    add_index :questions, :user_id
    add_index :questions, [:questionable_type, :questionable_id], unique: true
  end
end
