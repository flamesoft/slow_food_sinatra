Given(/^is logged in as "([^"]*)"$/) do |user|
  @admin_user = User.create(username: username, password: password, admin: 1)
end

Given(/^I am on the admin page$/) do |page|
  pending
end
