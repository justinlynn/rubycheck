all: test

test: gem example.rb
	ruby example.rb

gem: rubycheck.gemspec
	gem build rubycheck.gemspec
	gem install ./rubycheck-*.gem