class SubmissionsController < ApplicationController
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.submissions.new
    @assignment.questions.each{|q| @submission.answers.new(question: q)}
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.submissions.new(submission_params)
    @enrollment = @assignment.classroom.enrollments.find_by(user: current_user)
    @submission.enrollment = @enrollment

    if @submission.save
      flash[:notice] = 'Thank you for completing your assignment!'
      redirect_to assignments_path
    else
      flash[:alert] = 'you should drop out'
      render :new
    end
  end

  private
    def submission_params
      params.require(:submission).permit(answers_attributes:
                                [:submission_id, :option_id, :question_id])
    end
end
