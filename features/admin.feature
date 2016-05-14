Feature: As the restaurant owner
  So that my customers can pick up their orders
  I would like to put a restaurant description, and address on my website.

Background:
  Given I am a logged-in user
  Given that following dishes exist in the system
  |name             |price  |
  |Sushi of the day |89     |
  |Yakiniku         |99     |
  |Bento box        |115    |
  |Matcha Icecream  |49     |

Scenario: Allows the owner to access an admin page
  Given I am on the "home page"
  And is logged in as "admin"
  And I click on the "admin" button
  Then I should be on the "admin page"

Scenario: Allows the owner to update restaurant name, description and address.
  Given I am on the admin page
  And I fill in "restaurant_name" with "Sakura"
  And I fill in "restaurant_description" with "A cheap sushi place, perfect for lunch"
  And I fill in "restaurant_address" with "Valhallavägen 73"
  And I click on the "update_Restaurant" button
  Then I should see "You have updated restaurant information for restaurant Sakura"
