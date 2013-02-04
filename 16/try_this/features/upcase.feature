Feature: Upcasing
  Scenario: Upcasing a list of words
    Given the input "fee fi fo fum"
    When the upcaser is run
    Then the output should be "FEE FI FO FUM"
