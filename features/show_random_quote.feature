Feature:

  In order to view a random quote
  As a user
  I want to see a random quote

  @wip
  Scenario: Show message that no quotes are available
    Given there are no quotes present
    When I view the quotes page
    Then I see that no quotes are available

  Scenario: Show a random quote
    Given there is a quote present
    When I view the quotes page
    Then I see a quote
