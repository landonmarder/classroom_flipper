class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id, null: false
      t.integer :classroom_id, null: false

      t.timestamps
    end
  end
end
