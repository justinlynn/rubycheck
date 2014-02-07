guard :shell do
  watch(/^Rakefile|\..*|\.rb$/) do |m|
    title = 'Test'
    eager 'rake test'
    status = ($?.success? && :success) || :failed
    n '', title, status
    ''
  end
end
