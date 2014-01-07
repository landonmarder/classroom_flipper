require 'spec_helper'

feature 'teacher edits classroom information' do
  # ACCEPTANCE CRITERIA
  # * I am authenticated teacher
  # * I have created a valid classroom
  # * I click on the classroom from a list of classrooms
  # * I have the option to edit a classroom (click edit)
  # * I can change description or name as long as they are valid
  # * Saved when I click submit

  let (:teacher) { FactoryGirl.create(:teacher) }
  scenario 'teacher successfully edits a classroom' do
    FactoryGirl.create(:classroom, user_id: teacher.id)
    sign_in_as(teacher)
    visit classrooms_path
    click_on 'Edit'
    expect(page).to have_content('Edit Classroom:')
    fill_in 'Name', with: 'Biology'
    fill_in 'Description', with: 'Learning about animals'
    click_on 'Edit Classroom'

    expect(page).to have_content('Classroom updated successfully.')
    expect(page).to have_content('Manage Your Classrooms')
    expect(page).to have_content('Biology')
    expect(page).to_not have_content('MyString')
  end
end
