def signout_as_instructor instructor
  visit static_pages_instructor_path
  click_link "Sign Out"
end