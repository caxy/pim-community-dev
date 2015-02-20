Feature: Edit a group
  In order to manage the users and rights
  As an administrator
  I need to be able to edit a user role

  Background:
    Given the "default" catalog configuration
    And I am logged in as "Peter"

  @javascript
  Scenario: Successfully edit a user role
    Given I am on the user roles page
    And I should see "Catalog manager"

    When I click on the "Update" action of the row which contains "Catalog manager"

    Given I edit the "Catalog manager" user role
    And I fill in the following information:
      | Role     |  |
    When I save the role
    Then I should see validation tooltip "This value should not be blank."
    When I fill in the following information:
      | Role     | BugsBunny |
    When I save the role
    Then I should see "BugsBunny"

    # revert change
    Given I edit the "BugsBunny" user role
    And I fill in the following information:
      | Role     | Catalog manager |
    When I save the role
    Then I should see "Catalog manager"
