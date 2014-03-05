class StaticPagesController < ApplicationController
  def home
  end

  def instructor
    @instructor_courses = []
    Course.all.each do |course|
      if course.instructor_id == current_instructor.id
        @instructor_courses.push(course)
      end
    end
    @instructor_courses
  end
end