class Classroom < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user

  belongs_to :user,
    inverse_of: :classrooms

  has_many :enrollments,
    inverse_of: :classroom,
    dependent: :destroy

  has_many :assignments,
    inverse_of: :classroom,
    dependent: :destroy

  def enrolled?(user)
    enrollments.where(user_id: user.id).present?
  end

  def students
    students = []
    enrollments = Enrollment.where(classroom_id: self.id)
    enrollments.each do |enrollment|
      user_id = enrollment.user_id
      students << User.find(user_id)
    end
    students
  end
end
