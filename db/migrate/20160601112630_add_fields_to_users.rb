class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string, null: true
    add_column :users, :lastname, :string, null: true
    add_column :users, :avatar, :string, null: true
  end
end
