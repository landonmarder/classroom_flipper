require 'spec_helper'

describe User do
  it { should have_valid(:role).when('Student', 'Teacher') }
  it { should_not have_valid(:role).when(nil, '', 'boy', 'girl') }

  it { should have_many(:enrollments).dependent(:destroy) } # How do I do the distinction of student and teacher for the have many
  it { should have_many(:classrooms).dependent(:destroy) }

  it { should have_valid(:first_name).when('Landon') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Landon') }
  it { should_not have_valid(:last_name).when(nil, '') }
end
