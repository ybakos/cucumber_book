When /^I search for "([^"]*)"$/ do |query|
  visit('/search')
  fill_in('query', :with => query)
  click_button('Search')
end

Then /^the results should be:$/ do |expected_results|
  results = [['username', 'content']] + page.all('ol.results li').map do |li|
    [li.text[/^(.*?):/, 1], li.text[/^.*?: (.*)/, 1]]
  end
  puts results
  expected_results.diff!(results)
end