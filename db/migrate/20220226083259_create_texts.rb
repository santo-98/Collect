class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :title
      t.string :description
      t.boolean :mandatory
      t.string :response
      t.integer :question_id

      t.timestamps
    end
    add_index :texts, :question_id
  end
end
