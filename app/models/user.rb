class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role
  validates_inclusion_of :role, in: ['Student', 'Teacher']
  validates_presence_of :last_name
  validates_presence_of :first_name
  validates_uniqueness_of :email

  has_many :enrollments, #if a student
    inverse_of: :user,
    dependent: :destroy

  has_many :classrooms, # if a teacher
    inverse_of: :user,
    dependent: :destroy
end
