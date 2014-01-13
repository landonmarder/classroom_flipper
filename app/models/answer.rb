class Answer < ActiveRecord::Base
  validates_presence_of :question
  validates_presence_of :submission
  validates_presence_of :option

  belongs_to :submission,
    inverse_of: :answers

  belongs_to :question,
    inverse_of: :answers

  belongs_to :option,
    inverse_of: :answers
end
