require 'spec_helper'

describe Classroom do
  it { should have_valid(:name).when('Biology') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:description).when('Block of text') }
  it { should_not have_valid(:description).when('', nil) }

  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil) }

  it { should belong_to(:user) }
  it { should have_many(:assignments).dependent(:destroy) }
  it { should have_many(:enrollments).dependent(:destroy) }

  let(:student) { FactoryGirl.create(:student) }
  let(:classroom) { FactoryGirl.create(:classroom) }

  it '#enrolled? is true when a student is enrolled in a class' do
    expect(classroom.enrolled?(student)).to be false
    FactoryGirl.create(:enrollment, classroom_id: classroom.id, user_id: student.id)
    expect(classroom.enrolled?(student)).to be true
  end

  it 'makes an array of all the students in a classroom' do
    expect(classroom.students).to eql([])
    FactoryGirl.create(:enrollment, classroom_id: classroom.id, user_id: student.id)
    expect(classroom.students).to eql([student])
  end
end
