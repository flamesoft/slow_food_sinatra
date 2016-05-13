
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

Given(/^I fill in "([^"]*)" with "([^"]*)" for "([^"]*)"$/) do |quantity_box, quantity, dish|
  within("#{dish}") do
    fill_in(quantity_box, with: quantity)
  end
end

Given(/^I click on the "([^"]*)" button for "([^"]*)"$/) do |add_button, dish|
  within("#{dish}") do
    click_link_or_button(add_button)
  end
end
