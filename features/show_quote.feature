Feature:

  In order to view a random quote
  As a user
  I want to see a random quote

  Scenario:
    Given there are no quotes in the system
    When I view the quotes page
    Then I see that no quotes are available

  Scenario:
    Given there are quotes present in the system
    When I view the quotes page
    Then I see a quote
    And I see the author of the quote

