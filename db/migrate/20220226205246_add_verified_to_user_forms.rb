class AddVerifiedToUserForms < ActiveRecord::Migration[5.2]
  def change
    add_column :user_forms, :verified, :boolean
    add_column :users, :phone_number, :integer
  end
end
