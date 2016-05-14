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
