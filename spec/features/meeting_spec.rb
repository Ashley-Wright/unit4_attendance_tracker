require 'spec_helper'

describe "View Meetings" do
  context "View Meetings on Course Page" do
    before do
      @joe = Fabricate(:instructor)
      @course = Fabricate(:course, title: "Chemistry", instructor_id: @joe.id)
      Fabricate(:meeting, code: "123ABC", course_id: @course.id)
    end
    it "should see meetings on course page" do
      signin_as_instructor @joe
      page.should have_content("Chemistry")
      click_link "Chemistry"
      page.should have_content("Meetings")
      page.should have_content(Date.today)
    end
  end
end