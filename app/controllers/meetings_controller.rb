class MeetingsController < ApplicationController
  def create
    course = Course.find_by_id(params[:course_id])
    meeting = Meeting.where(course: course).where(:created_at => (8.hours.ago)..Time.now)
    if meeting.empty?
      @code = 6.times.map{[*'0'..'9',*'A'..'Z'].sample}.join
      Meeting.create!(course: course, code: @code)
    else
      flash[:notice] = "You have already created a code for today"
    end
  end

  def show
    @course = Course.find(params[:course_id])
    @meeting = Meeting.find(params[:id])
    @meeting_attendances = Attendance.joins(:meeting, :student).where(meeting: @meeting)
  end
end