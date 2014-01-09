require 'spec_helper'

describe Question do
  it { should have_valid(:assignment).when(Assignment.new) }
  it { should_not have_valid(:assignment).when(nil) }

  it { should have_valid(:prompt).when('This is the question?') }
  it { should_not have_valid(:prompt).when(nil, '') }

  it { should belong_to(:assignment) }
  it { should have_many(:options).dependent(:destroy) }
  it { should have_many(:answers).dependent(:destroy) }
end
