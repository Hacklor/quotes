Feature:

  In order to view a random quote
  As a user
  I want to see a random quote

  Scenario:
    Given there are no quotes present
    When I view the quotes page
    Then I see that no quotes are available

  Scenario:
    Given there is a quote present
    When I view the quotes page
    Then I see a quote
    And I see the author of the quote
