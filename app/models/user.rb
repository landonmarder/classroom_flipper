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

  has_many :enrolled_classrooms,
    through: :enrollments, source: :classroom

  has_many :student_assignments,
    through: :enrolled_classrooms, source: :assignments

  def is_teacher?
    role == 'Teacher'
  end

  def professional_name
    "#{salutation} #{last_name}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def all_classrooms
    if is_teacher?
      classrooms
    else
      enrolled_classrooms
    end
  end

  def all_assignments
    if is_teacher?
      assignments.includes(:classroom).order(created_at: :desc)
    else
      student_assignments.includes(:classroom).order(created_at: :desc)
    end
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
