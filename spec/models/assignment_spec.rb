require 'spec_helper'

describe Assignment do
  it { should have_valid(:classroom_id).when(1) }
  it { should_not have_valid(:classroom_id).when(nil) }

  it { should have_valid(:title).when("Calculate the Average") }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:description).when("Answer the questions based on the video", nil, '') }

  it { should have_valid(:status).when('Live', 'Closed') }
  it { should_not have_valid(:status).when('On', 'Off', '', nil) }

  it { should have_valid(:video_link).when('http://www.youtube.com/', 'https://vimeo.com/') }
  it { should_not have_valid(:video_link).when('youtube', 'vimeo', '', nil) } # Do I want to reject non- youtube and vimeo urls?

  it { should belong_to(:classroom) }

  it { should have_many(:submissions).dependent(:destroy) }
  it { should have_many(:questions).dependent(:destroy) }

  it { should accept_nested_attributes_for :questions }
end
