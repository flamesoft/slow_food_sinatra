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
    And I fill in "username" with "Jenny7"
    And I fill in "password" with "password"
    And I fill in "confirm_password" with "password"
    And I click on the Submit button
    Then I should be on the "home page"
    Then I should see "Successfully registered and logged in"

  Scenario: Disallows a visitor to sign up on a registration page
    Given I am on the "registration page"
    And I fill in "username" with "Jenny5"
    And I fill in "password" with "password"
    And I fill in "confirm_password" with "password2"
    And I click on the Submit button
    Then I should be on the registration page
    Then I should see "Password mismatch"

  Scenario: Allows a registered user to log in on a log in page
    Given I am on the "login page"
    And I fill in "username" with "Jenny"
    And I fill in "password" with "password"
    And I click on the "Enter" button
    Then I should be on the "home page"
    Then I should see "Successfully logged in"

  Scenario: As a visitor
    Given I am on the "registration page"
    And I fill in "username" with "Jenny"
    And I fill in "password" with ""
    And I fill in "confirm_password" with ""
    And I click on the "Submit" button
    Then I should be on the registration page
    Then I should see "Password can not be empty"

  Scenario: As a visitor
    Given I am on the "registration page"
    And I fill in "username" with ""
    And I fill in "password" with "password"
    And I fill in "confirm_password" with "password2"
    And I click on the "Submit" button
    Then I should be on the registration page
    Then I should see "User name can not be empty"

  Scenario: As a visitor
    Given I am on the "registration page"
    And I fill in "username" with "Jenny"
    And I fill in "password" with "password"
    And I fill in "confirm_password" with "password"
    And I click on the "Submit" button
    Then I should be on the registration page
    Then I should see "User name is taken"
