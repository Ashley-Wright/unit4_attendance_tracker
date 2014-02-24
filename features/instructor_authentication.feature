Feature: Instructor_authentication
  As an instructor
  I want to be able to sign up/sign in/sign out

  - Standard email/password sign up without email confirmation
  - Standard password reset via. email
  - Standard login/logout

  Scenario: Instructor signs up with email and password
    When I go to the home page
      And I follow "Sign Up"
      And I fill in "joe@example.com" for "Email"
      And I fill in "password" for "Password"
      And I fill in "password" for "Password confirmation"
      And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully"
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"
    When I follow "Sign Out"
    Then I should not see "Sign Out"
      And I should see "Sign In"
