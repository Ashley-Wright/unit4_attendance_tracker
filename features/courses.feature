Feature: Courses
  As an instructor
  I want to be able to create a course

  Scenario: Instructor creates a course
    Given the instructor "joe@example.com" with name "Joe Smith" and password "password"
      And I am signed in as Instructor "joe@example.com" with password "password"
    Then I should see "Courses"
      And I should see "create a new course"
    When I follow "create a new course"
      And I fill in "Chemistry" for "Title"
      And I press "Save"
    Then I should see "Chemistry"

    When I follow "Sign Out"
    Given the instructor "bob@example.com" with name "Bob Smith" and password "password"
      And I am signed in as Instructor "bob@example.com" with password "password"
    When I follow "create a new course"
      And I fill in "History" for "Title"
      And I press "Save"
    Then I should see "History"
      And I should not see "Chemistry"