require 'spec_helper'

feature 'student takes an assignment' do
  # ACCEPTANCE CRITERIA:
  # * I must be following my teacher’s feed
  # * My teacher must create a valid assignment that I have not completed
  # * Assignments are sorted by date created at
  # * I must click on the specific assignment I want to take by clicking on assignment name link
  # * I am taken to the assignment
  # * I must answer all of the questions from the assignment
  # * I cannot complete an assignment if there are unanswered questions
  # * I must submit a “finished” button
  # * I am prompted whether I am sure I want to finish
  # * I must not be able to access an assignment that I have already finished

  let(:question) { FactoryGirl.create(:question) }
  let(:option_correct) { FactoryGirl.create(:option, question: question, weight: 1) }
  let(:option_incorrect) { FactoryGirl.create(:option, question: question, option_value: 'Incorrect') }
  let(:assignment) { question.assignment }
  let(:teacher) { assignment.classroom.user }
  let(:enrollment) { FactoryGirl.create(:enrollment, classroom: assignment.classroom) }
  let(:student) { enrollment.user }

  scenario 'student takes an assignment everything works' do
    binding.pry
  end
end
