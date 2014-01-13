require 'spec_helper'

feature 'user views his or her assignments' do
  # ACCEPTANCE CRITERIA
  # * A teacher has already created an assignment for a classroom they own
  # * A student is enrolled in the classroom
  # * A user navigates to their assignments page
  # * User only sees assignments for classrooms they are in (teacher created, student enrolled)
  # * Teacher has assignment name, classroom, date created, status, view results.
  # * Student has assignment name, classroom, date created, status (updated at)
  # (assignment index)

  # let(:student_good) { enrollment_good.user }
  # let(:teacher_good) { enrollment_good.classroom.user }
  # let(:enrollment_good) { FactoryGirl.create(:enrollment) }
  # let(:assignment_good) { enrollment_good.classroom.assignments.first }

  let(:assignment_good) { FactoryGirl.create(:assignment) }
  let(:teacher_good) { assignment_good.classroom.user }
  let(:enrollment_good) { FactoryGirl.create(:enrollment, classroom: assignment_good.classroom) }
  let(:student_good) { enrollment_good.user }

  scenario 'teacher views assignments that they created' do
    sign_in_as(teacher_good)
    click_link 'View Assignments'

    expect(page).to have_content(assignment_good.title)
    expect(page).to have_content(assignment_good.classroom.name)
  end

  scenario 'student views assignments that they have to take' do
    sign_in_as(student_good)
    click_link 'View Assignments'

    expect(page).to have_content(assignment_good.title)
    expect(page).to have_content(assignment_good.classroom.name)
  end

  scenario 'teacher does not see assignments from another teacher' do

  end

  scenario 'student does not see assignments for classrooms they are not enrolled in' do
  end

  scenario 'non authenticated user cannot access assignments' do
  end
end
