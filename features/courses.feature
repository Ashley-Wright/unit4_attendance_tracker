Feature: Courses
  As an instructor
  I want to be able to create a course

  Scenario: Instructor creates a course
    Given the instructor "joe@example.com" with name "Joe Smith" and password "password"
      And I am signed in as Instructor
    Then I should see "Courses"
      And I should see "create a new course"
    When I follow "create a new course"
      And I fill in "Chemistry" for "Title"
      And I press "Save"
    Then I should see "Chemistry"
