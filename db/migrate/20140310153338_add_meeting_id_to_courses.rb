class AddMeetingIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :meeting_id, :integer
  end
end
