class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role
  validates_inclusion_of :role, in: ['Student', 'Teacher']

  has_many :enrollments,
    inverse_of: :user,
    dependent: :destroy

  has_many :classrooms,
    inverse_of: :user,
    dependent: :destroy
end
