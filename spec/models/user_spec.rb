require 'spec_helper'

describe User do
  it { should have_valid(:role).when('Student', 'Teacher') }
  it { should_not have_valid(:role).when(nil, '', 'boy', 'girl') }

  it { should have_valid(:first_name).when('Landon') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Marder') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_many(:enrollments).dependent(:destroy) }
  it { should have_many(:classrooms).dependent(:destroy) }
  it { should have_many(:assignments).through(:classrooms)}


  describe 'uniqueness validations' do
    before(:each) do
      FactoryGirl.create(:teacher)
    end
      it { should validate_uniqueness_of :email }
  end

  it 'teachers should have a teacher role' do
    teacher = FactoryGirl.create(:teacher)
    expect(teacher.is_teacher?).to be true
  end

  it 'students should not have a teacher role' do
    student = FactoryGirl.create(:student)
    expect(student.is_teacher?).to be false
  end
end
