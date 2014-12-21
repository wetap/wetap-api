@javascript
Feature: As an admin
  I want to see the existing fountains on a map
  So that I can manage my applications data.

  Background:
    Given I am logged in as an admin
    And there are some fountains
    And I am looking at the fountain admin

  Scenario: See fountains on a map
    Then I should see the fountains on the map
    And I should see the fountains on the list

