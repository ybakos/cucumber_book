Feature: Upcasing
  Scenario: Upcasing a list of words
    Given I run `upcaser fee fi fo fum`
    Then the file "result.txt" should contain "FEE FI FO FUM"
