Feature: Student Course Page
  As a student
  I want to be able to view the course page

  Scenario: View Student Course Page
    Given Instructor creates course
      And Student signs up for course
      And I am signed in as Student "jim@example.com" with password "password"
    Then I should see "Courses"
      And I should see "Chemistry"
    When I follow "Chemistry"
    Then I should see "Chemistry"
      And I should see "Enter Today's Code"
