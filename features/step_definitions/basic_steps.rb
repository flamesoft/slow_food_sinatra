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

Given(/^I fill in my username in the "([^"]*)" field$/) do |field|

end

Given(/^I fill in my password in the "([^"]*)" field$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I fill in my password again in the "([^"]*)" field$/) do |field|

end

Given(/^I click on the "([^"]*)" button$/) do |button|
  click_link_or_button button
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  expect(current_path).to eq '/auth/login'
end
