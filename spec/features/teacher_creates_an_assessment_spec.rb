require 'spec_helper'

feature 'teacher creates an assessment' do
  # ACCEPTANCE CRITERIA:
  # * I must go to the assignment page
  # * I must click make a new assignment
  # * I must name the assignment
  # * I must supply a valid link to the video
  # * I optionally write a brief description/instructions in the description box
  # * I must specify the questions that I want to be asked and the answers to the questions

  let(:student) { enrollment.user }
  let(:teacher) { enrollment.classroom.user }
  let(:enrollment) { FactoryGirl.create(:enrollment) }

  scenario 'teacher creates an assignment without questions' do
    sign_in_as(teacher)
    visit root_path
    click_link 'Assignments'
    save_and_open_page
  end

  scenario 'teacher creates an assignment with questions'

  scenario 'teacher creates an assignment with questions and options'

  scenario 'teacher gets errors with blank fields'

  scenario 'teacher gets an error if not youtube or vimeo'

  scenario 'unregistered user cannot create an assignment'

  scenario 'student cannot create an assignment'
end
