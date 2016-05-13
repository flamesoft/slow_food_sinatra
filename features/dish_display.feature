Feature: As a visitor
  So that I can plan an order
  I would like see the menu with price for dishes and the information of the restaurant.

Background:
  Given that following dishes exist in the system
  |name             |price  |
  |Sushi of the day |89     |
  |Yakiniku         |99     |
  |Bento box        |115    |
  |Matcha Icecream  |49     |

Scenario: Allows a visitor to the home page to see a list of dishes
  Given I am on the "home page"
  Then I should see "Sushi of the day"
  And I should see "Yakiniku"
  And I should see "Bento box"
  And I should see "Matcha Icecream"

Scenario: Display "no dishes message" if no dishes have been created
  Given there are no dishes in the system
  And I am on the "home page"
  Then I should see "No dishes in the system"
