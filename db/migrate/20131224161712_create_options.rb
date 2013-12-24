class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id, null: false
      t.string :option_value, null: false
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
