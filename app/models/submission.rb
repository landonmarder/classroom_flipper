class Submission < ActiveRecord::Base
  validates_presence_of :enrollment
  validates_presence_of :assignment

  validates_uniqueness_of :enrollment_id, scope: :assignment_id

  belongs_to :enrollment,
    inverse_of: :submissions

  belongs_to :assignment,
    inverse_of: :submissions

  has_many :answers,
    inverse_of: :submission,
    dependent: :destroy

  accepts_nested_attributes_for :answers
end
