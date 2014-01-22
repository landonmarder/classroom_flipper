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
  end

  scenario 'teacher goes back to classrooms index page after viewing a classroom' do
    sign_in_as(teacher)
    visit classrooms_path

    click_link 'More Info'
    click_link 'Back to Classroom Dashboard'
    expect(page).to have_content('Manage Your Classrooms')
  end

  scenario 'student cannot manage a classroom' do
    sign_in_as(student)
    visit classrooms_path

    expect(page).to_not have_content('Manage Your Classrooms')
  end
end
