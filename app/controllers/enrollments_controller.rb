class EnrollmentsController < ApplicationController
  before_action :authorize_teacher, only: [:destroy]

  def create
    @enrollment = Enrollment.new
    @enrollment.user = current_user
    @enrollment.classroom_id = params[:classroom_id]

    if @enrollment.save
      flash[:notice] = 'Thank you for enrolling!'
      redirect_to classrooms_path
    else
      flash[:notice] = 'There was an issue with your enrollment.'
      redirect_to classrooms_path
    end
  end

  def destroy
    Enrollment.find_by(classroom_id: params['id'], user_id: params['user_id']).destroy
    redirect_to classrooms_path, notice: 'Student has been removed.'
  end

  private
    def authorize_teacher
      unless user_signed_in? and current_user.is_teacher?
        access_denied("Sorry, only registered teachers can create a classroom.")
      end
    end
end
