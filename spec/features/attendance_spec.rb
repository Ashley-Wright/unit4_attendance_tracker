require 'spec_helper'

describe "Entering Attendance code" do
  context "Entering Course Attendance code" do
    before do
      @me = Fabricate(:student)
      @joe = Fabricate(:instructor)
      signin_as_instructor @joe
      @course = Fabricate(:course, title: "Chemistry", instructor_id: @joe.id)
      Fabricate(:meeting, code: "123ABC", course_id: @course.id)
      signout_as_instructor @joe
      signin_as_student @me
      page.should_not have_content("Chemistry")
      click_link "add a course"
      first(:link, "add").click
      page.should have_content("Chemistry")
      click_link "Chemistry"
      click_link "Enter Today's Code"
    end
    it "should be able to enter today's code" do
      page.should have_content("Date")
      fill_in "Code", with: "123ABC"
      click_button "Enter"
      page.should have_content("Chemistry")
      page.should have_content("Code was correct")
    end
  end
end