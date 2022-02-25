class AddTitleToForm < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :title, :string
  end
end
