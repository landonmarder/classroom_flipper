require 'spec_helper'

describe Assignment do
  it { should have_valid(:classroom).when(Classroom.new) }
  it { should_not have_valid(:classroom).when(nil) }

  it { should have_valid(:title).when("Calculate the Average") }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:description).when("Answer the questions based on the video", nil, '') }

  it { should have_valid(:status).when('Live', 'Closed') }
  it { should_not have_valid(:status).when('On', 'Off', '', nil) }

  it { should have_valid(:video_link).when('https://www.youtube.com/', 'https://vimeo.com/') }
  it { should_not have_valid(:video_link).when('youtube', 'vimeo', '', nil) } # Do I want to reject non- youtube and vimeo urls?

  it { should belong_to(:classroom) }

  it { should have_many(:submissions).dependent(:destroy) }
  it { should have_many(:questions).dependent(:destroy) }

  it { should accept_nested_attributes_for :questions }

  it "should parse a youtube video id" do
    assignment = FactoryGirl.create(:assignment)
    expect(assignment.parse_video).to eql("//www.youtube.com/embed/GEwEsdKrNcM")
  end

  it "should parse a vimeo video id" do
    assignment = FactoryGirl.create(:assignment, video_link: "https://vimeo.com/24894937")
    expect(assignment.parse_video).to eql("//player.vimeo.com/video/24894937")
  end

  it "should give an error if not vimeo or youtube" do
    assignment = FactoryGirl.create(:assignment, video_link: "https://www.espn.com")
    expect(assignment.parse_video).to eql("Error")
  end
end
