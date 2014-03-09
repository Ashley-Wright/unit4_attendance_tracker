class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(params[:enrollment].permit(:course_id, :student_id))
    @enrollment.save
    redirect_to static_pages_student_path
  end
end