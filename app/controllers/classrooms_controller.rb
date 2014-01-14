class ClassroomsController < ApplicationController
  before_action :authorize_teacher, only: [:create, :new, :update, :show]
  respond_to :html, :json, :js

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
      @classroom = Classroom.new
    else
      @search = Classroom.search(params[:q])
      @classrooms = @search.result
      @student_enrollments = Enrollment.classes_for(current_user)
    end
  end

  def search
    respond_to do |format|
      format.js { render :json => Classroom.search(params[:q]).result }
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

  def destroy
    Classroom.find(params[:id]).destroy
    redirect_to classrooms_path, notice: 'Classroom has been destroyed.'
  end

  def show
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name, :description)
  end

  def authorize_teacher
    unless user_signed_in? and current_user.is_teacher?
      access_denied("Sorry, only teachers can access this page.")
    end
  end
end
