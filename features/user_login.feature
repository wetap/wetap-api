Feature: As a user
  I want to make sure that I have to log in
  So that I can secure my application.

  @javascript

  Scenario: See login failure
    When I go to the fountain admin
    Then I should see the login page
