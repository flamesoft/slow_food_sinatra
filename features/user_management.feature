Feature: As a visitor
So that I can log in to the system and place orders
I would like to see a 'log in' or 'register' button on the home page.

Background:
  Given there is a User with username "Jenny" and password "password"

Scenario: Allows a visitor to access a login page
  Given I am on the "home page"
  And I click on the "Log In" link
  Then I should be on the login page

Scenario: Allows a visitor to access a registration page
  Given I am on the "home page"
  And I click on the "Sign Up" link
  Then I should be on the registration page

Scenario: Allows a visitor to sign up on a registration page
  Given I am on the "registration page"
  And I fill in "username" with "Jenny"
  And I fill in "password" with "password"
  And I fill in "confirm_password" with "password"
  And I click on the "Submit" button
  Then show me the page
  Then I should be on the login page

# Scenario: Allows a registered user to log in on a log in page
#    Given I am on the "login page"
#    And I fill in "username" with "Jenny"
#    And I fill in "password" with "password"
#    And I click on the "Log In" button
#    Then I should be on the "home page"
