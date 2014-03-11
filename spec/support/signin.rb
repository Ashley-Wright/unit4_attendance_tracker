def signin_as_instructor instructor
  visit new_instructor_session_path
  fill_in "Email", with: instructor.email
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end

def signin_as_student student
  visit new_student_session_path
  fill_in "Email", with: student.email
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end