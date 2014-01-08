require 'spec_helper'

feature 'student views all classes she is enrolled in' do
  # ACCEPTANCE CRITERIA:
  # * User goes to his/her classroom page
  # * User sees list of all his/her classrooms in her class page
  # * User does see list of other classes in the enrolled table

  let(:student) { FactoryGirl.create(:student) }
  let(:teacher) { FactoryGirl.create(:teacher) }

  scenario 'student sees a list of a class they are enrolled in' do
    sign_in_as(student)

    subject = FactoryGirl.create(:classroom)
    visit classrooms_path
    expect(page).to_not have_content('You are enrolled 0 classrooms.')

    FactoryGirl.create(:enrollment, user_id: student.id, classroom_id: subject.id)
    visit classrooms_path
    expect(page).to have_content('You are enrolled in 1 classroom.')
  end

  scenario 'user sees a list of all classes they own' do
    sign_in_as(teacher)
    visit classrooms_path
    expect(page).to have_content('You have 0 classrooms.')

    FactoryGirl.create(:classroom, user_id: teacher.id)
    visit classrooms_path
    expect(page).to have_content('You have 1 classroom.')
  end
end
