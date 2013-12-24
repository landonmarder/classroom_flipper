class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :enrollment_id, null: false
      t.integer :assignment_id, null: false

      t.timestamps
    end
  end
end
