require 'spec_helper'

describe "View Meetings" do
  context "View Meetings on Course Page" do
    before do
      @joe = Fabricate(:instructor)
      @jim = Fabricate(:student)
      @course = Fabricate(:course, title: "Chemistry", instructor_id: @joe.id)
      @meeting = Fabricate(:meeting, code: "123ABC", course_id: @course.id)
      Fabricate(:attendance, meeting_id: @meeting.id, student_id: @jim.id)
    end
    it "should see meetings on course page" do
      signin_as_instructor @joe
      page.should have_content("Chemistry")
      click_link "Chemistry"
      page.should have_content("Meetings")
      page.should have_content(Date.today)
      click_link "#{Date.today}"
      page.should have_content(Date.today)
      page.should have_content("Students")
      page.should have_content(@jim.name)
    end
  end
end