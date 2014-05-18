Feature: As an admin
  I want to add a new fountain
  So that I can manage my applications data.

  @javascript
  Scenario: Add a new fountain

    Given there are some fountains
    When I go to the new fountain page
    And I fill in '111' for 'longitude'
    And I fill in '222' for 'latitude'
    And I click button 'Create'
    Then I should see '111'