module SubmissionHelper
  def student_takes_assignment
    question_two = FactoryGirl.create(:question, assignment_id: assignment.id)
    option_correct = FactoryGirl.create(:option, question: question_two, weight: 1)
    option_incorrect = FactoryGirl.create(:option, question: question_two, option_value: 'Incorrect')

    sign_in_as(student)
    click_link 'My Assignments'
    click_link assignment.title

    question_block = page.all('.question-submission')
    question_block.each do |question|
      within(question) { select 'Choose C.' }
    end
    click_button 'Submit'
  end
end
