require 'httparty'

When /^the client requests GET (.*)$/ do |path|
  @last_response = HTTParty.get("http://localhost:9292#{path}")
end

Then /^the response should be JSON:$/ do |json|
  JSON.parse(@last_response.body).should == JSON.parse(json)
end


When /^the client requests POST (.*) with JSON:$/ do |path, json|
  HTTParty.post("http://localhost:9292#{path}", :body => {:name => 'strawberry', :color => 'red'})
end

Then /^I should see "(.*?)" and "(.*?)" when I list fruits$/ do |name, color|
  step "the client requests GET /fruits"
  JSON.parse(@last_response.body).collect { |hash| hash["name"] }.should include name
  JSON.parse(@last_response.body).collect { |hash| hash["color"] }.should include color
end