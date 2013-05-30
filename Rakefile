require "./lib/rubycheck"

task :default => "test"

task :test => [:gem, "example.rb"] do
  sh "ruby example.rb"
end

task :gem => "rubycheck.gemspec" do
  sh "gem build rubycheck.gemspec"
  sh "gem install ./rubycheck-#{RubyCheck::VERSION}.gem"
end

task :publish => [:gem] do
  sh "gem push ./rubycheck-#{RubyCheck::VERSION}.gem"
end

task :lint => [] do
  sh "bundle exec reek -q lib; true"
  sh "bundle exec flay lib"
end

task :clean => [] do
  sh "rm *.gem"
end
