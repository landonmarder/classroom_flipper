class Answer < ActiveRecord::Base
  validates_presence_of :question_id
  validates_presence_of :submission_id
  validates_presence_of :submission_value

  belongs_to :submission,
    inverse_of: :answers

  belongs_to :question,
    inverse_of: :answers
end
