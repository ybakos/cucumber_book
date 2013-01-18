Feature: Search
  Scenario: Find messages by content
    Given a User has posted the following messages:
      | content            |
      | I am making dinner |
      | I just woke up     |
      | I am going to work |
    When I search for "I am"
    Then the results should be:
      | username | content            |
      | testuser | I am making dinner |
      | testuser | I am going to work |