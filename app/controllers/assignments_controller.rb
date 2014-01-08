class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
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
    @assignments = @classrooms.map { |classroom| classroom.assignments }.flatten # Move this into Assignment model
  end

  private
  def assignment_params
    params.require(:assignment).permit(:classroom_id, :video_link, :title, :description)
  end
end
