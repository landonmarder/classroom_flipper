class Classroom < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user_id

  belongs_to :user,
    inverse_of: :classrooms

  has_many :enrollments,
    inverse_of: :classroom
end
