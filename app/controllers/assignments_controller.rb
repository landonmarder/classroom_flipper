class AssignmentsController < ApplicationController
  before_action :authorize_teacher, only: [:new, :create]

  def new
    @assignment = Assignment.new
    @question = @assignment.questions.build
    @option = @question.options.build
    @classrooms = Classroom.where(user_id: current_user.id)
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to assignments_path, notice: 'Assignment created successfully.'
    else
      render :new
    end
  end

  def index
    @classrooms = current_user.classrooms
    @assignments = @classrooms.map { |classroom| classroom.assignments }.flatten.sort_by{ |assignment| assignment.created_at }.reverse! # Move this into Assignment model
  end

  def show
    @assignment = Assignment.find(params[:id])
    @question_number = 1
  end

  private
  def assignment_params
    params.require(:assignment).permit(:classroom_id, :video_link, :title, :description,
                                        questions_attributes: [:assignment_id, :prompt, :_destroy,
                                          options_attributes: [:question_id, :option_value, :weight, :_destroy]])
  end

  def authorize_teacher
    unless user_signed_in? and current_user.is_teacher?
      access_denied("Sorry, only teachers can access this page.")
    end
  end
end
