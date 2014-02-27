Feature: Student_authentication
  As a student
  I want to be able to sign up/sign in/sign out

  - Standard email/password sign up without email confirmation
  - Standard password reset via. email
  - Standard login/logout

  Scenario: Student signs up with email and password
    When I go to the home page
      And I follow "Student"
      And I follow "Sign Up"
      And I fill in "jim@example.com" for "Email"
      And I fill in "password" for "Password"
      And I fill in "password" for "Password confirmation"
      And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully"
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"
    When I follow "Sign Out"
    Then I should see "Instructor"
      And I should see "Student"
      And I should not see "Sign Out"


  Scenario: Student can sign in and sign out
    Given the student "jim@example.com" with "password"
    When I go to the home page
      And I follow "Student"
      And I follow "Sign In"
      And I fill in "jim@example.com" for "Email"
      And I fill in "password" for "Password"
      And I press "Sign in"
    Then I should see "Signed in successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"
    When I follow "Sign Out"
    Then I should see "Instructor"
      And I should see "Student"
      And I should not see "Sign Out"