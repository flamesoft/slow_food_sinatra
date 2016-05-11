Given(/^there is a User with username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  @user = User.create(username: username, password: password)
end


Given(/^I am on the "([^"]*)"$/) do |page|
  visit '/'
end

Given(/^I click on the "([^"]*)" link$/) do |link|
  click_link_or_button link
end

Then(/^I should be on the login page$/) do
  expect(current_path).to eq '/auth/login'
end

Then(/^I should be on the registration page$/) do
  expect(current_path).to eq '/auth/register'
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

Given(/^I click on the "([^"]*)" button$/) do |button|
  click_link_or_button button
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  expect(current_path).to eq '/auth/login'
end
