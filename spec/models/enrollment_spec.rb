require 'spec_helper'

describe Enrollment do
  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:classroom).when(Classroom.new) }
  it { should_not have_valid(:classroom).when(nil) }

  it { should belong_to(:user) }
  it { should belong_to(:classroom) }

  it { should have_many(:submissions).dependent(:destroy) }

  it 'should list all the classes that a student is enrolled in' do
    student = FactoryGirl.create(:student)
    teacher = FactoryGirl.create(:teacher)
    classroom_bio = FactoryGirl.create(:classroom, name: 'Biology', user_id: teacher.id)
    classroom_math = FactoryGirl.create(:classroom, name: 'Math', user_id: teacher.id)
    FactoryGirl.create(:enrollment, user_id: student.id, classroom_id: classroom_bio.id)
    FactoryGirl.create(:enrollment, user_id: student.id, classroom_id: classroom_math.id)
    expect(Enrollment.classes_for(student)).to eql([classroom_bio, classroom_math])
  end

end
