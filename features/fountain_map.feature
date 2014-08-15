Feature: As an admin
  I want to see the existing fountains on a map
  So that I can manage my applications data.

  @javascript
  Scenario: See fountains on a map

    Given there are some fountains
    And I am logged in as an admin
    When I go to the fountain map page
    Then I should see the fountains on the map
