Feature: As a logged-in user
  So that I can place an order
  I would like to be able to add one or many dishes to my order.

  Background:
    Given I am a logged-in user
    Given that following dishes exist in the system
    |name             |price  |
    |Sushi of the day |89     |
    |Yakiniku         |99     |
    |Bento box        |115    |
    |Matcha Icecream  |49     |

  Scenario: Allows a user to add 1 dish to an order
    Given I am on the "home page"
    And I fill in "quantity_Yakiniku" with "1"
    And I click on the "add_Yakiniku" button
    Then I should see "You have added 1 Yakiniku"

  Scenario: Allows a user to add 2 sorts of dishes to an order
    Given I am on the "home page"
    And I fill in "quantity_Yakiniku" with "2"
    And I click on the "add_Yakiniku" button
    Then I should see "You have added 2 Yakiniku"
    And I fill in "quantity_Bentobox" with "1"
    And I click on the "add_Bentobox" button
    Then I should see "You have added 1 Bento box"

  Scenario: Display checkout button after a user has added 1 dish to an order
    Given I am on the "home page"
    And I fill in "quantity_Yakiniku" with "1"
    And I click on the "add_Yakiniku" button
    Then I should see "You have added 1 Yakiniku"
    Then I should see a check out button

  Scenario: Show order details after checkout
    Given I am on the "home page"
    And I fill in "quantity_Yakiniku" with "1"
    And I click on the "add_Yakiniku" button
    Then I should see "You have added 1 Yakiniku"
    And I click on the "check_out" button
    Then I should see "Thank you for your order!"
    Then I should see "Yakiniku"
    Then I should see "Total price: 99 kr"
