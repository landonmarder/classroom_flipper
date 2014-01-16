require 'spec_helper'

describe Submission do
  it { should have_valid(:enrollment).when(Enrollment.new) }
  it { should_not have_valid(:enrollment).when(nil) }

  it { should have_valid(:assignment).when(Assignment.new) }
  it { should_not have_valid(:assignment).when(nil) }

  it { should belong_to(:enrollment) }
  it { should belong_to(:assignment) }

  it { should have_many(:answers).dependent(:destroy) }

  it 'ensures that an enrolled student can only submit an assignment once' do
    FactoryGirl.create(:submission)
    should validate_uniqueness_of(:enrollment_id).scoped_to(:assignment_id)
  end
end
