require 'spec_helper'

feature 'teacher views class roster' do
  # ACCEPTANCE CRITERIA
  # * I am an authenticated teacher
  # * I have a classroom created
  # * I click on specific classroom I want to see roster of
  # * List gives me students names and information
  # * List has a link to delete a student from the class
  # (send to enrollment show)
  # * Tells you how many students are enrolled
  # * If there are no students enrolled, tells you there are 0 students enrolled
  # * Teacher can navigate back to classroom index page

  let(:student) { enrollment.user }
  let(:teacher) { enrollment.classroom.user }
  let(:enrollment) { FactoryGirl.create(:enrollment) }

  scenario 'teacher views classroom with 1 student enrolled' do
    sign_in_as(teacher)
    visit classrooms_path
    click_link 'More Info'

    expect(page).to have_content(student.full_name)
    expect(page).to have_content('Back to Classrooms')
  end

  scenario 'teacher goes back to classrooms index page after viewing a classroom' do
    sign_in_as(teacher)
    visit classrooms_path
    click_link 'More Info'
    click_link 'Back to Classrooms'
    expect(page).to have_content('Manage Your Classrooms')
  end

  scenario 'what does the student do?'
end
