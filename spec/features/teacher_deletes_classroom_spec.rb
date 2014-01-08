require 'spec_helper'

feature 'teacher deletes a classroom' do
  # ACCEPTANCE CRITERIA:
  # * I sign in and go to my classrooms list page
  # * I can click delete next to the appropriate classroom
  # * I am given a warning and then click okay
  # * The classroom is deleted

  let (:teacher) { FactoryGirl.create(:teacher) }

  scenario 'teacher deletes a classroom properly' do
    FactoryGirl.create(:classroom, user_id: teacher.id)
    sign_in_as(teacher)
    visit classrooms_path
    expect(page).to have_content('MyString')
    click_link 'Delete'

    expect(page).to_not have_content('MyString')
    expect(page).to have_content('Classroom has been destroyed.')
  end

  scenario 'what does a student do?'
end
