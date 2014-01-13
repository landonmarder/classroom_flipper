class AddOptionIdToAnswers < ActiveRecord::Migration
  def up
    add_column :answers, :option_id, :integer, null: false
    remove_column :answers, :submission_value
  end

  def down
    remove_column :answers, :option_id
    add_column :answers, :submission_value, :string, null: false
  end
end
