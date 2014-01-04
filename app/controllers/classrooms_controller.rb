class ClassroomsController < ApplicationController
  before_action :authorize_teacher

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

  def authorize_teacher
    unless user_signed_in? and current_user.is_teacher?
      access_denied("Sorry, only registered teachers can create a classroom.")
    end
  end
end
