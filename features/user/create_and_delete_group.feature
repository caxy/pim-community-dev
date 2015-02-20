Feature: Create a group
  In order to manage the users and rights
  As an administrator
  I need to be able to create a group

  Background:
    Given the "default" catalog configuration
    And I am logged in as "Peter"

  @javascript
  Scenario: Successfully create a user group
    Given I am on the user groups creation page
    And I fill in the following information:
      | Name     | DummyGroup1 |
      | Owner    | Main        |
    When I save the group
    Then there should be a "DummyGroup1" user group
    
    When I am on the user groups page
    Then the grid should contain 4 elements
    And I should see "DummyGroup1"


    When I am on the user groups creation page
    And I fill in the following information:
      | Name     | DummyGroup2 |
      | Owner    | Main        |
    When I save the group
    And I fill in the following information:
      | Name     | DummyGroup3 |

    When I save the group
    Then there should be a "DummyGroup3" user group

    When I am on the user groups page
    Then the grid should contain 5 elements
    And I should see "DummyGroup1"
    And I should see "DummyGroup3"
    And I should not see "DummyGroup2"

    Given I am on the user groups creation page
    When I save the group
    Then I should see "This value should not be blank."

  @javascript
  Scenario: Delete created groups for database integrity
    Given I am on the user groups page
    When I click on the "Delete" action of the row which contains "DummyGroup1"
    Then I should see "Delete Confirmation"
    And I confirm the deletion
    When I click on the "Delete" action of the row which contains "DummyGroup3"
    Then I should see "Delete Confirmation"
    And I confirm the deletion

    Given I am on the user groups page
    Then there should be a "Redactor" user group
    When I click on the "Delete" action of the row which contains "Redactor"
    Then I should see a confirm dialog with the following content:
      | title   | Delete Confirmation                         |
      | content | Are you sure you want to delete this group? |
    When I cancel the deletion
    Then there should be a "Redactor" user group
    And I should see "Redactor"
