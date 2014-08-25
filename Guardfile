guard :shell do
  watch(/^Rakefile|\..*|\.rb$/) do ||
    title = 'Test'
    eager 'rake test'
    status = ($CHILD_STATUS.success? && :success) || :failed
    n '', title, status
    ''
  end
end
