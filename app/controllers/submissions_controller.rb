class SubmissionsController < ApplicationController
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @question_number = 1
    @submission = @assignment.submissions.new
    # @submission.enrollment = @enrollment
    @answer = @submission.answers.new
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @enrollment = @assignment.classroom.enrollments.find_by(user: current_user)

    @submission = Submission.new
    @submission.enrollment_id = @enrollment.id
    @submission.assignment_id = @assignment.id

    if @submission.save
      flash[:notice] = 'Thank you for completing your assignment!!'
      redirect_to assignments_path
    else
    end
  end

  private
  def answer_params
    binding.pry
    params.require(:submission).permit(answer_attributes: [:id, :option_id, :question_id])
  end
end
