Given /^the input "(.*?)"$/ do |input|
  steps %{
    Given a file named "input.txt" with:
      """
      #{input}
      """
  }
end

When /^the calculator is run$/ do
  path = File.expand_path("#{File.dirname(__FILE__)}/../../calculator.rb")
  steps %{
    When I run `ruby #{path} input.txt`
  }
end

Then /^the output should be "(.*?)"$/ do |output|
  steps %{
    Then it should pass with:
      """
      #{output}
      """
  }
end

