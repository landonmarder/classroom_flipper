require 'spec_helper'


feature 'teacher creates a classroom' do
# Acceptance Criteria
# * I must supply valid classroom name, description, teacher
# * If classroom name, description is not valid, I cannot create classroom
# * A classroom must contain the user_id for the teacher that creates it
# * I must click on create classroom button
# * Student cannot create a classroom
  let(:teacher) { FactoryGirl.create(:teacher) }

  scenario 'teacher fills out creating the classroom form properly' do
    sign_in_as(teacher)
    click_link 'Create Classroom'
    fill_in 'Name', with: '6th Math Problem Solving'
    fill_in 'Description', with: "Ms.TeacherLast's Classroom at Birth Elementary School"
    click_button 'Create Classroom'

    expect(page).to have_content("Name: 6th Math Problem Solving")
    expect(page).to have_content('Your classroom is successfully created!')
  end

  scenario 'teacher does not fill out creating the classroom for properly' do
    sign_in_as(teacher)
    click_link 'Create Classroom'
    fill_in 'Name', with: ''
    click_button 'Create Classroom'
        save_and_open_page

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'a student tries to create a classroom'

  scenario 'a non-authenticated user tries to create a classroom'

  scenario 'a teacher cannot create a classroom for another teacher'
end
