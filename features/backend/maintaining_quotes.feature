Feature:

  In order to maintain the quotes
  As a user
  I want to be able to add, edit and delete quotes

  Scenario: Viewing the quotes when there are no quotes present
    When I go to the quotes maintenance page
    Then I see that there are no quotes available in the backend

  Scenario: Viewing the quotes
    Given there is a quote present
    When I go to the quotes maintenance page
    Then I see the quotes

  Scenario: Adding a quote
    When I go to the quotes maintenance page
    And I add a new quote
    Then I see the quote

  Scenario: Editing an existing quote
    Given there is a quote present
    When I go to the quotes maintenance page
    And I edit an existing quote
    Then I see that the quote has been updated

  Scenario: Removing an existing quote
    Given there is a quote present
    When I go to the quotes maintenance page
    And I delete an existing quote
    Then I see that the quote has been removed

  Scenario: Tweeting a quote
    Given there is a quote present
    When I go to the quotes maintenance page
    And I tweet a quote
    Then I see that the quote has been tweeted
