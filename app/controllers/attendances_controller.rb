class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
    @@course = Course.find_by_id(params[:course_id])
  end

  def create
    meeting = Meeting.where(course: @@course).where(:created_at => (1.day.ago)..Time.now)
    code = params[:attendance][:code]

    if meeting
      if meeting[0].code == code
        Attendance.create!(meeting: meeting[0], student: current_student)
        flash[:notice] = "Code was correct"
        redirect_to course_path(@@course)
      else
        flash[:notice] = "Try again"
        redirect_to new_course_attendance_path(@@course)
      end
    else
      flash[:notice] = "Meeting does not exist"
      redirect_to new_course_attendance_path(@@course)
    end
  end
end