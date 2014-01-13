class Submission < ActiveRecord::Base
  validates_presence_of :enrollment
  validates_presence_of :assignment

  belongs_to :enrollment,
    inverse_of: :submissions

  belongs_to :assignment,
    inverse_of: :submissions

  has_many :answers,
    inverse_of: :submission,
    dependent: :destroy
end
