

Then /^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/ do |amount|
  # a "test double"
  cash_slot.contents.should == amount
end
