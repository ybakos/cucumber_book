Feature: Adding fruit
  In order to make a great smoothiie
  I want to add some fruit
  So that I can one day eat.

  Scenario: Add fruit
    Given the system knows about the following fruit:
      | name       | color   |
      | banana     | yellow  |
    When the client requests POST /fruits with JSON:
      """
      {"name": "strawberry", "color": "red"}
      """
    Then I should see "strawberry" and "red" when I list fruits
