require 'spec_helper'

feature 'student views all classes she is enrolled in' do
  # ACCEPTANCE CRITERIA:
  # * Student goes to his/her classroom page
  # * Student sees list of all his/her classrooms in her class page
  # * Student does see list of other classes in the enrolled table
  # * Student does not see edit/delete links

  let(:student) { FactoryGirl.create(:student) }

  scenario 'student sees a list of a class they are enrolled in' do
    sign_in_as(student)
    teacher = FactoryGirl.create(:teacher)
    subject = FactoryGirl.create(:classroom, name: 'Biology', user_id: teacher.id)
    visit classrooms_path
    expect(page).to_not have_content('You are enrolled 0 classrooms.')
    FactoryGirl.create(:enrollment, classroom_id: subject.id, user_id: student.id)
    visit classrooms_path
    expect(page).to have_content('You are enrolled in 1 classroom.')
  end

  scenario 'what does a teacher do?'
end
