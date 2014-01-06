require 'spec_helper'

feature 'teacher creates a classroom' do
# Acceptance Criteria
# * I must supply valid classroom name, description, teacher
# * If classroom name, description is not valid, I cannot create classroom
# * A classroom must contain the user_id for the teacher that creates it
# * I must click on create classroom button
# * Student cannot create a classroom
# Teacher can view all the classrooms that they have created
# Each classroom in a list has title, destroy, edit, more info links

  let(:teacher) { FactoryGirl.create(:teacher) }
  let(:student) { FactoryGirl.create(:student) }

  scenario 'teacher fills out creating the classroom form properly' do
    sign_in_as(teacher)
    click_link 'Manage Classrooms'
    expect(page).to have_content 'Manage Your Classrooms'

    click_link 'Create Classroom'
    fill_in 'Name', with: '6th Math Problem Solving'
    fill_in 'Description', with: "Ms.TeacherLast's Classroom at Birth Elementary School"
    click_button 'Create Classroom'

    expect(page).to have_content("Class Name")
    expect(page).to have_content("6th Math Problem Solving")
    expect(page).to have_content("Description")
    expect(page).to have_content("Ms.TeacherLast's Classroom at Birth Elementary School")
    expect(page).to have_content("Delete")
    expect(page).to have_content("Edit")
    expect(page).to have_content("More Info")
    expect(page).to have_content('Your classroom is successfully created!')
  end

  scenario 'teacher does not fill out creating the classroom for properly' do
    sign_in_as(teacher)
    click_link 'Manage Classrooms'
    expect(page).to have_content 'Manage Your Classrooms'

    click_link 'Create Classroom'
    fill_in 'Name', with: ''
    click_button 'Create Classroom'

    expect(page).to have_content("Namecan't be blank")
    expect(page).to have_content("Descriptioncan't be blank")
  end

  scenario 'a student does not see option to create a classroom' do
    sign_in_as(student)
    expect(page).to_not have_content('Manage Classroom')
  end

  scenario 'a student cannot get to the page to create a classroom' do
    sign_in_as(student)
    visit new_classroom_path
    expect(page).to have_content('Welcome')
    expect(page).to have_content('Sorry, only registered teachers can create a classroom.')
  end

  scenario 'a non-authenticated user tries to create a classroom' do
    visit new_classroom_path
    expect(page).to have_content('Welcome')
    expect(page).to have_content('Sorry, only registered teachers can create a classroom.')
  end
  # scenario 'a teacher cannot create a classroom for another teacher' # Do I need this?
end
