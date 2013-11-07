require "./lib/rubycheck"

task :default => "test"

task :test => ["example.rb"] do
  sh "bundle exec ruby example.rb"
end

task :gem => "rubycheck.gemspec" do
  sh "gem build rubycheck.gemspec"
  sh "gem install ./rubycheck-#{RubyCheck::VERSION}.gem"
end

task :publish => [:gem] do
  sh "gem push ./rubycheck-#{RubyCheck::VERSION}.gem"
end

task :lint => [] do
  sh "bundle exec reek -q .; true"
  sh "bundle exec flay ."
  sh "bundle exec flog ."
  sh "bundle exec roodi -config=roodi.yml *.rb **/*.rb"
  sh "bundle exec cane -f *.rb; bundle exec cane **/*.rb"
end

task :churn => [] do
  sh "bundle exec churn"
end

task :clean => [] do
  sh "rm *.gem"
end
