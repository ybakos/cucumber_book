Given /^a board like this:$/ do |table|
  # table is a Cucumber::Ast::Table
  @board = table.raw
end

When /^player x plays in row (\d+), column (\d+)$/ do |row, col|
  @board[row.to_i][col.to_i] = 'x'
end

Then /^the board should look like this:$/ do |expected_table|
  expected_table.diff!(@board)
end