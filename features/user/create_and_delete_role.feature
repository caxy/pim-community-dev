Feature: Create and delete a user role
  In order to manage the users and rights
  As an administrator
  I need to be able to create a role

  Background:
    Given the "default" catalog configuration
    And I am logged in as "Peter"

  @javascript
  Scenario: Successfully create a user role
    Given I am on the user roles creation page
    And I fill in the following information:
      | Role     | Dummy role |
    When I save the role
    Then the grid should contain 4 elements
    And I should see "Dummy role"

    Given I am on the user roles creation page
    When I save the role
    Then I should see validation tooltip "This value should not be blank."

  @javascript
  Scenario: Successfully delete a role after confirmation
    Given I am on the user roles page
    When I click on the "Delete" action of the row which contains "Dummy role"
    Then I should see a confirm dialog with the following content:
      | title   | Delete Confirmation                        |
      | content | Are you sure you want to delete this role? |
    When I confirm the deletion
    Then I should not see "Dummy role"

    When I click on the "Delete" action of the row which contains "Administrator"
    Then I should see a confirm dialog with the following content:
      | title   | Delete Confirmation                        |
      | content | Are you sure you want to delete this role? |
    When I cancel the deletion
    And I should see "Administrator"
