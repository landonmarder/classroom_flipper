class Enrollment < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :classroom_id

  has_many :submissions,
    inverse_of: :enrollment,
    dependent: :destroy

  belongs_to :classroom,
    inverse_of: :enrollments

  belongs_to :user,
    inverse_of: :enrollments
end
