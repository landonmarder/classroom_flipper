require 'spec_helper'

feature 'teacher removes student from classroom' do
# Acceptance Criteria
# * I must go to my classroom page
# * I must have students enrolled in my classroom
# * I must have the option to remove students from my classroom list by clicking remove student
# * I am prompted whether I am sure or not, if I click yes, student is removed from the classroom
# * Student cannot remove himself from the classroom

  let(:student) { enrollment.user }
  let(:teacher) { enrollment.classroom.user }
  let(:enrollment) { FactoryGirl.create(:enrollment)}

  scenario 'teacher removes a student' do
    sign_in_as(teacher)
    visit classroom_path(enrollment.classroom)

    expect(page).to have_content(student.full_name)
    click_button('-')
    expect(page).to_not have_content(student.full_name)
  end

  scenario 'student can not remove a student' do
    sign_in_as(student)
    visit classroom_path(enrollment.classroom)

    expect(page).to_not have_content(student.full_name)
    click_button('-')
  end
end
