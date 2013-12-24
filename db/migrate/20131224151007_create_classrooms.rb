class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
