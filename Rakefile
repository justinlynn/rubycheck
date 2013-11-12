require './lib/rubycheck'

task :default => 'test'

task :test => ['example.rb'] do
  sh 'bundle exec ruby example.rb'
end

task :gem => 'rubycheck.gemspec' do
  sh 'gem build rubycheck.gemspec'
  sh "gem install ./rubycheck-#{RubyCheck::VERSION}.gem"
end

task :publish => [:gem] do
  sh "gem push ./rubycheck-#{RubyCheck::VERSION}.gem"
end

task :ruby => [] do
  begin
    sh 'for f in *.rb; do ruby -wc $f | grep -v "Syntax OK"; done'
  rescue
  end
  begin
    sh 'for f in **/*.rb; do ruby -wc $f | grep -v "Syntax OK"; done'
  rescue
  end
end

task :reek => [] do
  sh 'bundle exec reek -q .; true'
end

task :flay => [] do
  sh 'bundle exec flay .'
end

task :roodi => [] do
  sh 'bundle exec roodi -config=roodi.yml *.rb **/*.rb'
end

task :cane => [] do
  sh 'bundle exec cane -f *.rb; bundle exec cane **/*.rb'
end

task :excellent => [] do
  sh 'bundle exec excellent .'
end

task :rubocop => [] do
  sh 'bundle exec rubocop **/*.rb **/*.erb **/Guardfile*'
end

task :tailor => [] do
  sh 'bundle exec tailor'
end

task :lint => [:ruby, :reek, :flay, :roodi, :cane, :excellent, :rubocop, :tailor] do
end

task :flog => [] do
  sh 'bundle exec flog .'
end

task :churn => [] do
  sh 'bundle exec churn'
end

task :clean => [] do
  begin
    sh 'rm *.gem'
  rescue
  end

  begin
    sh 'rm -rf tmp'
  rescue
  end
end
