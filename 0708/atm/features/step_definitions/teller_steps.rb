When /^I withdraw (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^I should be told that I have insufficient funds in my account$/ do
  message.should == "Insufficient funds brah!"
end

Then /^I should be told to have a nice day$/ do
  message.should == "Thank you, have a nice day!"
end