Feature: As an admin
  I want to see the existing fountains on a map
  So that I can manage my applications data.

  @javascript @wip
  Scenario: See fountains on a map

    Given I am logged in as an admin
    And there are some fountains
    And I am looking at the fountain admin
    Then I should see the fountains on the map
    And I should see the fountains on the list
