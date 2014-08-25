Feature: As an admin
  I want to edit existing fountains
  So that I can manage my applications data.

  @javascript
  Scenario: Add a new fountain
    Given there are some fountains
    And I am logged in as an admin
    And I am on the new fountain page
    When I edit the first fountain
    And I fill in '111' for 'longitude'
    And I fill in '222' for 'latitude'
    And I click button 'Update'
    Then I should see that I successfully updated the fountain
