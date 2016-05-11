Feature: As a visitor
So that I can log in to the system and place orders
I would like to see a 'log in' or 'register' button on the home page.

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
  And I fill in my username in the "username" field
  And I fill in my password in the "password" field
  And I fill in my password in the "repeat_password" field
  And I click on the "Sign Up" button
  Then I should be on the login page
