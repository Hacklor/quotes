Feature:

  In order to maintain the quotes
  As a user
  I want to be able to add, edit and delete quotes

  Scenario:
    Given there are no quotes present
    When I go to the quotes maintenance page
    Then I see that no quotes are available

  Scenario:
    Given there are quotes present in the system
    When I go to the quotes maintenance page
    Then I see the quotes
