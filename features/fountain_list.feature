Feature: As an admin
   I want to see a list of existing fountains
   So that I can manage my applications data.

   @javascript
  Scenario: See a list of fountains

    Given there are some fountains
    When I go to the fountain list page
    Then I should see a list of fountains