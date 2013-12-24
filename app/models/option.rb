class Option < ActiveRecord::Base
  validates_presence_of :question_id
  validates_presence_of :option_value

  belongs_to :question,
    inverse_of: :options
end
