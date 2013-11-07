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

task :reek => [] do
  sh "bundle exec reek -q .; true"
end

task :flay => [] do
  sh "bundle exec flay ."
end

task :roodi => [] do
  sh "bundle exec roodi -config=roodi.yml *.rb **/*.rb"
end

task :cane => [] do
  sh "bundle exec cane -f *.rb; bundle exec cane **/*.rb"
end

task :lint => [:reek, :flay, :roodi] do
end

task :flog => [] do
  sh "bundle exec flog ."
end

task :churn => [] do
  sh "bundle exec churn"
end

task :clean => [] do
  sh "rm *.gem"
end
