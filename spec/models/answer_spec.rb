require 'spec_helper'

describe Answer do
  it { should have_valid(:question).when(Question.new) }
  it { should_not have_valid(:question).when(nil) }

  it { should have_valid(:submission).when(Submission.new) }
  it { should_not have_valid(:submission).when(nil) }

  it { should have_valid(:submission_value).when("First you add, then you divide") }
  it { should_not have_valid(:submission_value).when(nil, '') }

  it { should belong_to(:question) }
  it { should belong_to(:submission) }

end
