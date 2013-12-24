class AddNameToUser < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
  end

  def down
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
