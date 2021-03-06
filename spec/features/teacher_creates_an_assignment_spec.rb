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

  scenario 'teacher creates an assignment without questions or answers' do
    sign_in_as(teacher)
    visit root_path
    click_link 'Create Assignment'

    expect(page).to have_content('Create Assignment')
    select 'Biology', from: 'Classroom'
    fill_in 'Video URL', with: "http://www.youtube.com/watch?v=GEwEsdKrNcM"
    fill_in 'Title', with: 'Playing Sick'
    fill_in 'Description', with: 'Watch the videos and then answer the questions below.'
    click_button 'Create Assignment'
    expect(page).to have_content("Assignment created successfully")
  end

  scenario 'teacher gets an error if not youtube or vimeo' do
    sign_in_as(teacher)
    visit root_path
    click_link 'Create Assignment'

    expect(page).to have_content('Create Assignment')
    fill_in 'Video URL', with: 'badwebsite'
    click_button 'Create Assignment'
    expect(page).to have_content('is invalid')
  end

  scenario 'unregistered user cannot create an assignment' do
    visit new_assignment_path
    expect(page).to have_content('Sorry, only teachers can access this page.')
  end

  scenario 'student cannot create an assignment' do
    sign_in_as(student)
    visit new_assignment_path

    expect(page).to have_content('Welcome')
    expect(page).to have_content('Sorry, only teachers can access this page.')
  end
end
