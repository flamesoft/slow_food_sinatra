Feature: As a visitor
  So that I can plan an order
  I would like see the name of the restaurant, the address of the restaurant and a description of the restaurant.

Background:
  Given that following restaurant information exists in the system
  |name             |address  |description  |
  |Flying Fish      |Danderydsgatan 18     |A high-end sushi restaurant|


Scenario: Allows a visitor to the home page to see the restaurant name
  Given I am on the "home page"
  Then I should see "Flying Fish"
  And I should see "Danderydsgatan 18"
  And I should see "A high-end sushi restaurant"
