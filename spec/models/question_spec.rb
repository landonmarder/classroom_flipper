require 'spec_helper'

describe Question do
  it { should have_valid(:assignment).when(Assignment.new) }
  it { should_not have_valid(:assignment).when(nil) }

  it { should have_valid(:prompt).when('This is the question?') }
  it { should_not have_valid(:prompt).when(nil, '') }

  it { should belong_to(:assignment) }
  it { should have_many(:options).dependent(:destroy) }
  it { should have_many(:answers).dependent(:destroy) }

  it "gives an array of all the option values for a question" do
  question = FactoryGirl.create(:question)
  option_correct = FactoryGirl.create(:option, question: question, weight: 1)
  option_incorrect = FactoryGirl.create(:option, question: question, option_value: 'Incorrect')

  expect(question.option_values).to eql([option_correct.option_value, option_incorrect.option_value])
  end
end
