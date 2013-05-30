Gem::Specification.new { |s|
  s.name = "rubycheck"
  s.summary = "a Ruby port of the QuickCheck unit test framework"
  s.description = "See example.rb for API usage."

  s.version = "0.0.1"
  s.date = "2013-02-13"

  s.authors = ["Andrew Pennebaker"]
  s.email = "andrew.pennebaker@gmail.com"

  s.files = ["lib/rubycheck.rb", "example.rb"]

  s.homepage = "http://www.yellosoft.us/quickcheck"

  s.add_development_dependency "reek"
  s.add_development_dependency "flay"
}
