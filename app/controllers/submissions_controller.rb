class SubmissionsController < ApplicationController
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @question_number = 1
    @enrollment = @assignment.classroom.enrollments.find_by(user: current_user)
    @submission = @assignment.submissions.new
    @answer = @submission.answers.new
  end

  def create
  @submission = Submission.new()
  end


  private
  def submission_params
    params.require(:submission).permit(:answer_attributes: [:option_id, :submission_id])
  end
end
