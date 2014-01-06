class AddSalutationToUser < ActiveRecord::Migration
  def up
    add_column :users, :salutation, :string, null: false
  end

  def down
    remove_column :users, :salutation
  end
end
