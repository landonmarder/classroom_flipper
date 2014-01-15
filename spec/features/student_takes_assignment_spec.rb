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
  let!(:option_correct) { FactoryGirl.create(:option, question: question, weight: 1) }
  let!(:option_incorrect) { FactoryGirl.create(:option, question: question, option_value: 'Incorrect') }
  let(:assignment) { question.assignment }
  let(:teacher) { assignment.classroom.user }
  let(:enrollment) { FactoryGirl.create(:enrollment, classroom: assignment.classroom) }
  let(:student) { enrollment.user }

  scenario 'student takes an assignment everything works' do
    submission_count = Submission.all.count
    answer_count = Answer.all.count
    sign_in_as(student)
    click_link 'My Assignments'
    click_link assignment.title

    select option_correct.option_value, from: 'Options'
    click_button 'Submit'
    expect(page).to have_content("View All Assignments")
    expect(page).to have_content("Thank you for completing your assignment!")
    expect(Submission.all.count).to eql(submission_count + 1)
    expect(Answer.all.count).to eql(answer_count + 1)
  end
end
