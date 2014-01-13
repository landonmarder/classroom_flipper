require 'spec_helper'

describe Option do
  it { should have_valid(:question).when(Question.new) }
  it { should_not have_valid(:question).when(nil) }

  it { should have_valid(:weight).when(1, 0) }

  it "should have a default weight of 0 if no weight is entered" do
    option = FactoryGirl.create(:option)
    expect(option.weight).to eql(0)
  end

  it { should have_valid(:option_value).when('First you add all the values, then divide') }
  it { should_not have_valid(:option_value).when('', nil) }

  it { should belong_to(:question) }
  it { should have_many(:answers).dependent(:destroy) }
end
