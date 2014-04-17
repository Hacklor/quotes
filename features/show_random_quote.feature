Feature:

  In order to view a random quote
  As a user
  I want to see a random quote

  Scenario: Show message that no quotes are available
    When I view the quotes page
    Then I see that no quotes are available

  Scenario: Show a random quote
    Given there is a quote present
    When I view the quotes page
    Then I see a quote
