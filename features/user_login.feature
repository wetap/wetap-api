Feature: As a user
  I want to make sure that I have to log in
  So that I can secure my application.

  @javascript

  Scenario: See login failure
    Given there are some fountains
    When I go to the fountain list page
    Then I should see the login page
