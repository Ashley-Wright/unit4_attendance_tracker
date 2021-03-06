Feature: Courses Sign Up
  As a student
  I want to be able to sign up for a course

  Scenario: Student signs up for a course
    Given 2 course
      And the student "jim@example.com" with name "Jim Smith" and password "password"
      And I am signed in as Student "jim@example.com" with password "password"
    Then I should see "Courses"
      And I should see "add a course"
    When I follow "add a course"
    Then I should see "Class0"
      And I should see "Class1"
    When I follow "add"
    Then I should see "Courses"
      And I should see "Class0"
      And I should not see "Class1"