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
  validates_presence_of :salutation
  validates_inclusion_of :salutation, in: ['Mr.', 'Mrs.', 'Ms.', 'Dr.']

  has_many :classrooms,
    inverse_of: :user,
    dependent: :destroy

  has_many :enrollments,
    inverse_of: :user,
    dependent: :destroy

  has_many :assignments,
    through: :classrooms

  has_many :submissions,
    through: :enrollments

  def is_teacher?
    role == 'Teacher'
  end

  class << self
    def role_options
      ['Student', 'Teacher']
    end

    def salutations
      ['Mr.', 'Mrs.', 'Ms.', 'Dr.']
    end
  end
end
