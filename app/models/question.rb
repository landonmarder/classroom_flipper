class Question < ActiveRecord::Base
  validates_presence_of :assignment_id
  validates_presence_of :prompt

  belongs_to :assignment,
    inverse_of: :questions

  has_many :options,
    inverse_of: :question,
    dependent: :destroy

  has_many :submission_answers,
    inverse_of: :question,
    dependent: :destroy
end