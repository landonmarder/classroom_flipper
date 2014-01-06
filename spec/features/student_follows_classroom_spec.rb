require 'spec_helper'

feature 'student follows a classroom' do
  # ACCEPTANCE CRITERIA:
  # * I must be able to click on "manage classrooms" button that redirects me to classroom page and has a button to find a classroom
  # * I must click on find a classroom
  # * I must be able to search for my teacher based on classroom name
  # * I must be able to choose to follow my classroom
  # * I am redirected to my manage classroom page where it shows I am enrolled in the class

  let (:student) { FactoryGirl.create(:student) }
  let (:teacher) { FactoryGirl.create(:teacher) }

  scenario 'student searches for a classroom that exists and enrolls' do
    FactoryGirl.create(:classroom, name: 'Biology', user_id: teacher.id)
    FactoryGirl.create(:classroom, name: 'Math', user_id: teacher.id)

    sign_in_as(student)
    click_link "Manage Classrooms"

    expect(page).to have_content('Manage Classrooms')
    expect(page).to have_content('Biology')
    expect(page).to have_content('Math')
    expect(page).to have_content(teacher.professional_name)

    fill_in 'Classroom Name', with: 'Biology'
    click_button 'Search'

    expect(page).to have_content('Biology')
    expect(page).to_not have_content('Math')

    click_button '+'
    expect(page).to have_content('Thank you for enrolling!')
    expect(page).to have_content('Manage Classrooms')
  end

  scenario 'student cannot enroll in a class that they are already enrolled in' do
    classroom = FactoryGirl.create(:classroom, name: 'Biology', user_id: teacher.id)
    FactoryGirl.create(:enrollment, classroom_id: classroom.id, user_id: student.id)

    sign_in_as(student)
    click_link "Manage Classrooms"

    expect(page).to have_content('Manage Classrooms')
    expect(page).to have_content('Biology')
    expect(page).to have_content(teacher.professional_name)

    fill_in 'Classroom Name', with: 'Biology'
    click_button 'Search'

    expect(page).to have_content('Biology')
    expect(page).to have_content('Enrolled')

    expect(page).to have_content('Manage Classrooms')
  end

  scenario 'teacher does not have access to follow a classroom' do
    sign_in_as(teacher)
  end

  scenario 'non signed in user does not have access to follow a classroom'
end
