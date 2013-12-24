class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :assignment_id, null: false
      t.text :prompt, null: false

      t.timestamps
    end
  end
end
