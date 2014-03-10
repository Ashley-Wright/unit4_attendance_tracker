When(/^I go to the home page$/) do
  visit root_path
end

When(/^I follow "(.*?)"$/) do |text|
  first(:link, text).click
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |content, field|
  fill_in(field, with: content)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

Given(/^the instructor "(.*?)" with name "(.*?)" and password "(.*?)"$/) do |email, name, password|
  Instructor.create(name: name, email: email, password: password, password_confirmation: password)
end

Given(/^the student "(.*?)" with name "(.*?)" and password "(.*?)"$/) do |email, name, password|
  Student.create(name: name, email: email, password: password, password_confirmation: password)
end

Given(/^I am signed in as Instructor "(.*?)" with password "(.*?)"$/) do |email, password|
  steps %Q{
    When I go to the home page
      And I follow "Instructor"
      And I follow "Sign In"
      And I fill in "#{email}" for "Email"
      And I fill in "#{password}" for "Password"
      And I press "Sign in"
  }
end

Given(/^a course titled "(.*?)"$/) do |title|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am signed in as Student "(.*?)" with password "(.*?)"$/) do |email, password|
  steps %Q{
    When I go to the home page
      And I follow "Student"
      And I follow "Sign In"
      And I fill in "#{email}" for "Email"
      And I fill in "#{password}" for "Password"
      And I press "Sign in"
  }
end

Given(/^Instructor creates course$/) do
  steps %Q{
    Given the instructor "joe@example.com" with name "Joe Smith" and password "password"
      And I am signed in as Instructor "joe@example.com" with password "password"
    When I follow "create a new course"
      And I fill in "Chemistry" for "Title"
      And I press "Save"
      And I follow "Sign Out"
  }
end

Given(/^Student signs up for course$/) do
  steps %Q{
    Given the student "jim@example.com" with name "Jim Smith" and password "password"
      And I am signed in as Student "jim@example.com" with password "password"
    When I follow "add a course"
    When I follow "add"
      And I follow "Sign Out"
  }
end

Then(/^I should see the daily code$/) do
  code = page.find(:xpath, '//h3').text
  code.length.should eq(6)
end
