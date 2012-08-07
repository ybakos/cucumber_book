Given /^my account has been credited with (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  my_account.credit(amount)
end

Then /^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  # An example of using sampling. See support/async_support.rb
  eventually { my_account.balance.should eq(amount) }
end
