require 'spec_helper'

describe Answer do
  it { should have_valid(:question_id).when(1) }
  it { should_not have_valid(:question_id).when(nil) }

  it { should have_valid(:submission_id).when(1) }
  it { should_not have_valid(:submission_id).when(nil) }

  it { should have_valid(:submission_value).when("First you add, then you divide") }
  it { should_not have_valid(:submission_value).when(nil, '') }

  it { should belong_to(:question) }
  it { should belong_to(:submission) }

end
