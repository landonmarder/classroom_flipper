class Submission < ActiveRecord::Base
  validates_presence_of :enrollment_id
  validates_presence_of :assignment_id

  belongs_to :enrollment,
    inverse_of: :submissions

  belongs_to :assignment,
    inverse_of: :submissions

  has_many :submission_answers,
    inverse_of: :submission,
    dependent: :destroy
end
