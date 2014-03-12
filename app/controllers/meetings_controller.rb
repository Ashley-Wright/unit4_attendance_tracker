class MeetingsController < ApplicationController
  def create
    @code = 6.times.map{[*'0'..'9',*'A'..'Z'].sample}.join
    course = Course.find_by_id(params[:course_id])
    Meeting.create!(course: course, code: @code)
  end

  def show
    @course = Course.find(params[:course_id])
    @meeting = Meeting.find(params[:id])
    @meeting_attendances = Attendance.joins(:meeting, :student).where(meeting: @meeting)
  end
end