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
end
