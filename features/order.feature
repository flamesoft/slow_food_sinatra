Feature: As a logged-in user
  So that I can place an order
  I would like to be able to add one or many dishes to my order.

  Background:
    Given there is a User with username "Jenny" and password "password"
    Given that following dishes exist in the system
    |name             |price  |
    |Sushi of the day |89     |

  Scenario: Allows a user to add 1 dish to an order
    Given I am on the "home page"
    And I fill in "Quantity" with "1"
    And I click on the "Order" button
    Then I should see "You have added 1 dish in your cart"
