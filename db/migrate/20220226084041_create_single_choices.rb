class CreateSingleChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :single_choices do |t|
      t.string :title
      t.string :description
      t.boolean :mandatory
      t.string :response
      t.integer :question_id
      t.text :options

      t.timestamps
    end
    add_index :single_choices, :question_id
  end
end
