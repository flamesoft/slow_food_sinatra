Given(/^there is a User with username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  @user = User.create(username: username, password: password)
end


Given(/^I am on the "([^"]*)"$/) do |page|
  case page
    when 'home page' then
      visit '/'
    when 'registration page' then
      visit '/auth/register'
    when 'login page' then
      visit '/auth/login'
  end
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
  within("form#login_form") do
    click_link_or_button button
  end
end

Given(/^I click on the Submit button$/) do
  click_link_or_button 'Submit'
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  expect(current_path).to eq '/auth/login'
end
