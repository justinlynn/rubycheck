require './lib/version'

Gem::Specification.new { |s|
    s.name = 'rubycheck'
    s.summary = 'a Ruby port of the QuickCheck unit test framework'
    s.description = 'See specs/ tests for example usage.'
    s.license = 'BSD-2-Clause-FreeBSD'

    s.version = RubyCheck::VERSION

    s.authors = ['Andrew Pennebaker']
    s.email = 'andrew.pennebaker@gmail.com'

    s.files = Dir['lib/*.rb'] + ['LICENSE.md']

    s.homepage = 'http://www.yellosoft.us/quickcheck'

    s.required_ruby_version = '>= 2.0'

    s.add_dependency 'contracts', '~> 0.10.1'

    s.add_development_dependency 'rake', '~> 12.3.3'
    s.add_development_dependency 'reek', '~> 1.3'
    s.add_development_dependency 'flay', '~> 2.5'
    s.add_development_dependency 'flog', '~> 4.3'
    s.add_development_dependency 'roodi', '~> 4.0'
    s.add_development_dependency 'churn', '~> 1.0'
    s.add_development_dependency 'cane', '~> 2.6'
    s.add_development_dependency 'excellent', '~> 2.1'
    s.add_development_dependency 'rubocop', '~> 0.49'
    s.add_development_dependency 'tailor', '~> 1.4'
    s.add_development_dependency 'rspec', '~> 3.0'
    s.add_development_dependency 'aspelllint', '~> 0.10'
}
