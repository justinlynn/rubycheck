Given(/^the program has finished$/) do
  @cucumber = `rake test 2>/dev/null`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")

  lines.length.should == 6

  lines[0 .. 1].join("\n").should =~ /^\*\*\* Failed!\n\[[0-9]+\]$/m
  lines[2].should == '+++ OK, passed 10000 tests.'
  lines[3 .. 4].join("\n").should =~ /^\*\*\* Failed!\n\[\".*\"\]$/m
  lines[5].should == '+++ OK, passed 10000 tests.'
end
