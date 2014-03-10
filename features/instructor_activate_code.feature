Feature: Activate Code
  As an instructor
  I want to be able to display a daily attendance code

  Scenario: Display Code
    Given Instructor creates course
      And I am signed in as Instructor "joe@example.com" with password "password"
    When I follow "Chemistry"
    Then I should see "activate code"
    When I follow "activate code"
    Then I should see "Date"
      And I should see the daily code
