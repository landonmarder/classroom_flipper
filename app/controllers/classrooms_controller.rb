class ClassroomsController < ApplicationController
  def new
    @classroom = Classroom.new
  end

  def create
    @user = current_user
    @classroom = current_user.classrooms.build(classroom_params)

    if @classroom.save
      redirect_to classrooms_path,
        notice: "Your classroom is successfully created!"
    else
      render :new
    end
  end

  def index
    @user = current_user
    @classrooms = Classroom.where(user: current_user)
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name, :description)
  end
end
