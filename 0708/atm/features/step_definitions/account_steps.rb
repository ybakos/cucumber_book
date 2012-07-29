Given /^my account has been credited with (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  my_account.credit(amount)
end

Then /^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  my_account.balance.should eq(amount), "Expected the balance to be #{amount} but was #{my_account.balance}."
end

Then /^I should be told that I have insufficient funds in my account$/ do
  pending # express the regexp above with the code you wish you had
end