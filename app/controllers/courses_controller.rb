class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course].permit(:title))
    @course.instructor_id = current_instructor.id
    if @course.save
      redirect_to static_pages_instructor_path
    else
      render 'new'
    end
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @course_enrollments = Enrollment.joins(:course, :student).where(course: @course)
    @course_meetings = Meeting.where(course: @course)
  end
end
