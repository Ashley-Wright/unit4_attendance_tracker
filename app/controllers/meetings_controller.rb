class MeetingsController < ApplicationController
  def create
    @code = 6.times.map{[*'0'..'9',*'A'..'Z'].sample}.join
    course = Course.find_by_id(params[:course_id])
    Meeting.create!(course: course, code: @code)
  end
end