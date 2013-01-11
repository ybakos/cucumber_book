Given /^there is a User$/ do
  FactoryGirl.build(:user).save
end

Given /^the User has posted the message "([^"]*)"$/ do |message_text|
  User.count.should == 1
  FactoryGirl.build(:message, :content => message_text, :user => User.first).save
end

When /^I visit the page for the User$/ do
  User.count.should == 1
  visit(user_path(User.first))
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end