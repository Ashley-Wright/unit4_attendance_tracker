class EnrollmentsController < ApplicationController

  def create
    course = Course.find_by_id(params[:course_id])
    Enrollment.create!(student: current_student, course: course)
    flash[:notice] = "You have successfully signed up for this course."
    redirect_to static_pages_student_path
  end

end