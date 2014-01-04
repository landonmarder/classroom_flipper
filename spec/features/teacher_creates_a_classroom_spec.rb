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
    save_and_open_page
    click_link 'Settings'
    click_link 'Create Classroom'
    fill_in 'Name', with: '6th Math Problem Solving'
    fill_in 'Description', with: "Ms.TeacherLast's Classroom at Birth Elementary School"
    click_button 'Create Classroom'

    expect(page).to have_content('Settings')
    expect(page).to have_content('Classroom successfully created!')
  end

  scenario 'a teacher cannot create a classroom for another teacher'

  scenario 'teacher does not fill out creating the classroom for properly'

  scenario 'a non-authenticated user tries to create a classroom'

  scenario 'a student tries to create a classroom'
end
