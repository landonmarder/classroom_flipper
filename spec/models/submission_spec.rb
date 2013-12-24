require 'spec_helper'

describe Submission do
  it { should have_valid(:enrollment_id).when(1) }
  it { should_not have_valid(:enrollment_id).when(nil, '') }

  it { should have_valid(:assignment_id).when(1) }
  it { should_not have_valid(:assignment_id).when(nil, '') }

  it { should belong_to(:enrollment) }
  it { should belong_to(:assignment) }

  it { should have_many(:answers).dependent(:destroy) }
end
