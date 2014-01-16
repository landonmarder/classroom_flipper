require 'spec_helper'

describe Question do
  it { should have_valid(:assignment).when(Assignment.new) }
  it { should_not have_valid(:assignment).when(nil) }

  it { should have_valid(:prompt).when('This is the question?') }
  it { should_not have_valid(:prompt).when(nil, '') }

  it { should belong_to(:assignment) }
  it { should have_many(:options).dependent(:destroy) }
  it { should have_many(:answers).dependent(:destroy) }

  let(:question) { FactoryGirl.create(:question) }
  let!(:option_correct) { FactoryGirl.create(:option, question: question, weight: 1) }
  let!(:option_incorrect) { FactoryGirl.create(:option, question: question, option_value: 'Incorrect') }
  let!(:answer_billy) { FactoryGirl.create(:answer, option: option_correct) }
  let!(:answer_joe) { FactoryGirl.create(:answer, option: option_incorrect) }
  it "should have a hash that holds option name and number of people that selected that option for a question" do
    # binding.pry
    expect(question.answers_per_option).to eql({ "#{option_correct.option_value}" => 1, "#{option_incorrect.option_value}" => 1 })
  end

end
