Gem::Specification.new { |s|
  s.name = 'rubycheck'
  s.summary = 'a Ruby port of the QuickCheck unit test framework'
  s.description = 'See example.rb for API usage.'

  s.version = '0.0.3'
  s.date = '2014-02-06'

  s.authors = ['Andrew Pennebaker']
  s.email = 'andrew.pennebaker@gmail.com'

  s.files = ['lib/rubycheck.rb']

  s.homepage = 'http://www.yellosoft.us/quickcheck'

  s.add_dependency 'contracts'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'reek'
  s.add_development_dependency 'flay'
  s.add_development_dependency 'flog'
  s.add_development_dependency 'roodi'
  s.add_development_dependency 'churn'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'excellent'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'tailor'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-shell', '>= 0.6'
  s.add_development_dependency 'rspec'
}
