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
      redirect_to assignments_path
      flash[:notice] = 'Thank you for completing your assignment!'
    else
      if @submission.errors.messages.include?(:enrollment_id)
        flash[:alert] = 'You have already submitted this assignment. Feel free to review.'
        render :new
      else
        flash[:alert] = 'You need to answer all questions.'
        render :new
      end
    end
  end

  private
    def submission_params
      params.require(:submission).permit(answers_attributes:
                                [:submission_id, :option_id, :question_id])
    end
end
