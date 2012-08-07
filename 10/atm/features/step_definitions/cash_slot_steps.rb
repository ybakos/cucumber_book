Then /^nothing should be dispensed$/ do
  cash_slot.contents.should == 0
end

Then /^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/ do |amount|
  # a "test double"
  cash_slot.contents.should == amount
end
