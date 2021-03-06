Feature: As the restaurant owner
  So that my customers can pick up their orders
  I would like to put a restaurant description, and address on my website.

  Background:
    Given I am an admin user
    Given that following dishes exist in the system
      | name             | price |
      | Sushi of the day | 89    |
      | Yakiniku         | 99    |

  Scenario: Allows the owner to access an admin page
    Given I am on the "admin page"
    And I fill in "username" with "admin"
    And I fill in "password" with "1234"
    And I click on the Log in to admin page button
    Then I should see "Welcome administrator"
    And I should see "Restaurant Name"


  Scenario: Allows the owner to add restaurant name, description and address.
    Given I am on the "admin page"
    And I fill in "username" with "admin"
    And I fill in "password" with "1234"
    And I click on the Log in to admin page button
    And I fill in "restaurant_description" with "A cheap sushi place, perfect for lunch"
    And I fill in "restaurant_address" with "Valhallavägen 73"
    And I click on the "update_restaurant" button
    Then show me the page
    Then I should see "You have updated restaurant information for restaurant Flying Fish"

  Scenario: Allows the owner to modify restaurant name, description and address.
    Given I am on the "admin page"
    And I fill in "username" with "admin"
    And I fill in "password" with "1234"
    And I click on the Log in to admin page button
    And there is already an existing restaurant
    And I fill in "restaurant_description" with "A high-end sushi place"
    And I fill in "restaurant_address" with "Danderydsgatan 18"
    And I click on the "update_restaurant" button
    Then I should see "You have updated restaurant information for restaurant Flying Fish"

  Scenario: Allows the owner to see the menu page
    Given I am on the "admin page"
    And I fill in "username" with "admin"
    And I fill in "password" with "1234"
    And I click on the Log in to admin page button
    And I click the "Add/Modify Menu" link
    Then I should see "Add/Modify Menu"
    And "Yakiniku" should display

  Scenario: Allows the owner to add a dish to the menu
    Given I am on the "admin page"
    And I fill in "username" with "admin"
    And I fill in "password" with "1234"
    And I click on the Log in to admin page button
    And I click the "Add/Modify Menu" link
    And I fill in "new_dish[name]" with "Sashimi 2"
    And I fill in "new_dish[price]" with "155"
    And I fill in "new_dish[category]" with "Main course"
    And I click on the "Add" button
    Then I should see "You have added 1 dish - Main course: Sashimi 2, 155 kr"
    And I should see "Sashimi 2"
    And I am on the "home page"
    Then I should see "Sashimi 2"

