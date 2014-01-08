require 'spec_helper'

feature 'teacher edits classroom information' do
  # ACCEPTANCE CRITERIA
  # * I am authenticated teacher
  # * I have created a valid classroom
  # * I click on the classroom from a list of classrooms
  # * I have the option to edit a classroom (click edit)
  # * I can change description or name as long as they are valid
  # * Saved when I click submit

  let(:student) { enrollment.user }
  let(:teacher) { enrollment.classroom.user }
  let(:enrollment) { FactoryGirl.create(:enrollment)}

  scenario 'teacher successfully edits a classroom' do
    sign_in_as(teacher)
    visit classrooms_path

    click_on 'Edit'
    expect(page).to have_content('Edit Classroom:')
    fill_in 'Name', with: 'Biology'
    fill_in 'Description', with: 'Learning about animals'
    click_on 'Edit Classroom'

    expect(page).to have_content('Classroom updated successfully.')
    expect(page).to have_content('Biology')
  end

  scenario 'teacher tries to edit a classroom, but leaves the fields blank' do
    sign_in_as(teacher)
    visit classrooms_path

    click_on 'Edit'
    expect(page).to have_content('Edit Classroom:')
    fill_in 'Name', with: ''
    fill_in 'Description', with: ''
    click_on 'Edit Classroom'

    expect(page).to have_content("Namecan't be blank")
    expect(page).to have_content("Descriptioncan't be blank")
  end

  scenario 'student cannot edit a classroom' do
    sign_in_as(student)
    visit classroom_path(enrollment.classroom)
    expect(page).to have_content('Sorry, only teachers can access this page.')
  end
end
