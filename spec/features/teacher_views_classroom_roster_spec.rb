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

  let(:student) { FactoryGirl.create(:student) }
  let(:teacher) { FactoryGirl.create(:teacher)}

  scenario 'teacher views classroom with 1 student enrolled' do
    create_enrollment_environment(student, teacher)
    sign_in_as(teacher)
    visit classrooms_path
    click_link 'More Info'

    expect(page).to have_content('Biology')
    expect(page).to have_content(student.full_name)
    expect(page).to have_content('Remove Student')
    expect(page).to have_content('Back to Classrooms')
  end

  scenario 'teacher goes back to classrooms index page after viewing a classroom' do
    create_enrollment_environment(student, teacher)
    sign_in_as(teacher)
    visit classrooms_path
    click_link 'More Info'
    click_link 'Back to Classrooms'
    save_and_open_page
    expect(page).to have_content('Manage Your Classrooms')
  end

  scenario 'teacher views clsasroom with 0 students enrolled'
end
