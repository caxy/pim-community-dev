Feature: Create a group
  In order to manage the users and rights
  As an administrator
  I need to be able to edit a group

  Background:
    Given the "default" catalog configuration
    And I am logged in as "Peter"

  @javascript
  Scenario: Successfully edit a user group
    Given I am on the user groups page
    Then there should be a "Manager" user group
    And I should see "Manager"

    When I click on the "Update" action of the row which contains "Manager"
#    Then I should be on the user groups edit page

    Given I edit the "Manager" user group
    And I fill in the following information:
      | Name     | BugsBunny |
    When I save and close
    Then I should see "This value should not be blank."
    When I fill in the following information:
      | Name   |      |
      | Owner  | Main |
    When I save and close
    Then I should see "This value should not be blank."
    And I fill in the following information:
      | Name     | BugsBunny |
      | Owner    | Main      |
    When I save and close
    Then there should be a "BugsBunny" user group
    And I should see "BugsBunny"

    # revert change
    Given I edit the "BugsBunny" user group
    And I fill in the following information:
      | Name     | Manager |
    When I save and close
    Then there should be a "Manager" user group
