Feature: Course Page
  As an instructor
  I want to be able to view the course page with enrolled students listed

  Scenario: View Course Page
    Given Instructor creates course
      And Student signs up for course
      And I am signed in as Instructor "joe@example.com" with password "password"
    Then I should see "Courses"
    When I follow "Chemistry"
    Then I should see "Chemistry"
      And I should see "Students"
      And I should see "Jim Smith"
