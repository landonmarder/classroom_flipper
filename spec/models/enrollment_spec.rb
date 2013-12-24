require 'spec_helper'

describe Enrollment do
  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil) }

  it { should have_valid(:classroom_id).when(1) }
  it { should_not have_valid(:classroom_id).when(nil) }

  it { should belong_to(:user) }
  it { should belong_to(:classroom) }

  it { should have_many(:submissions).dependent(:destroy) }

end
