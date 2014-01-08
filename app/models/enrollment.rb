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

  def self.classes_for(user)
    enrollments = Enrollment.where(user_id: user.id)
    enrollment_holder = []
    enrollments.each do |enrollment|
      enrollment_holder << Classroom.find(enrollment.classroom_id)
    end
    enrollment_holder
  end
end
