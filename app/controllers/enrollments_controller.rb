class EnrollmentsController < ApplicationController

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
end
