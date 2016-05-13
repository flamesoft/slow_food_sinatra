
Given(/^I am a logged\-in user$/) do
  steps %Q{
    Given there is a User with username "Jenny" and password "password"
    Given I am on the "login page"
    And I fill in "username" with "Jenny"
    And I fill in "password" with "password"
    And I click on the "Enter" button
    Then I should be on the "home page"
    Then I should see "Successfully logged in"
   }
end

Given(/^I see a list of dishes$/) do
  steps %Q{
    Given I am on the "home page"
    Then I should see "Sushi of the day"
    And I should see "Yakiniku"
    And I should see "Bento box"
    And I should see "Matcha Icecream"
  }
end

Given(/^I fill in "([^"]*)" with "([^"]*)" for "([^"]*)"$/) do |arg1, arg2, arg3|
  pending # Write code here that turns the phrase above into concrete actions
end
