require 'spec_helper'

describe Submission do
  it { should have_valid(:enrollment).when(Enrollment.new) }
  it { should_not have_valid(:enrollment).when(nil) }

  it { should have_valid(:assignment).when(Assignment.new) }
  it { should_not have_valid(:assignment).when(nil) }

  it { should belong_to(:enrollment) }
  it { should belong_to(:assignment) }

  it { should have_many(:answers).dependent(:destroy) }

  it 'gives the results of a submission for a student' do
    submission = FactoryGirl.create(:submission)
    question_one = FactoryGirl.create(:question)
    option_correct = FactoryGirl.create(:option, question: question_one, weight: 1)
    answer_one = FactoryGirl.create(:answer, option: option_correct, question: question_one, submission: submission)

    question_two = FactoryGirl.create(:question)
    option_incorrect = FactoryGirl.create(:option, question: question_two, weight: 0)
    answer_two = FactoryGirl.create(:answer, option: option_incorrect, question: question_two, submission: submission)
    binding.pry
    expect()
  end
end
