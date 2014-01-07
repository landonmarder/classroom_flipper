class ClassroomsController < ApplicationController
  before_action :authorize_teacher, only: [:create, :new, :update]

  def new
    @classroom = Classroom.new
  end

  def create
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
    if current_user.is_teacher?
      @classrooms = Classroom.where(user: current_user)
    else
      @search = Classroom.search(params[:q])
      @classrooms = @search.result
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end

  def update
    @classroom = Classroom.find(params[:id])

    if @classroom.update(classroom_params)
      redirect_to classrooms_path, notice: 'Classroom updated successfully.'
    else
      render :edit
    end
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
