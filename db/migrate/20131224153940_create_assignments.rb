class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :classroom_id, null: false
      t.string :video_link, null: false
      t.string :title, null: false
      t.text :description, default: 'Answer the questions below based on the video. Try your best!'
      t.string :status, null: false, default: 'Live'

      t.timestamps
    end
  end
end
