When(/^I go to the home page$/) do
  visit root_path
end

When(/^I follow "(.*?)"$/) do |text|
  click_link(text)
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