class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.integer :submission_id, null: false
      t.string :submission_value, null: false

      t.timestamps
    end
  end
end
