# rubycheck - a Ruby port of the QuickCheck unit test framework

Now [rspec](http://rspec.info/) compatible!

# EXAMPLE

```
$ rake test
rspec
......

Finished in 0.36783 seconds
6 examples, 0 failures
```

See [ios7crypt.rb](https://github.com/mcandre/ios7crypt/blob/master/ruby/ios7crypt.rb) or rubycheck's [self-tests](https://github.com/mcandre/rubycheck/blob/master/spec/rubycheck_spec.rb) for more information.

# HOMEPAGE

http://www.yellosoft.us/quickcheck

# RUBYGEMS

https://rubygems.org/gems/rubycheck

# RDOCS

http://rubydoc.info/gems/rubycheck/frames

# INSTALL

```
$ gem install rubycheck
```

# LICENSE

FreeBSD

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 1.9+

# DEVELOPMENT

Checkout the code and install the dependencies:

```
$ git clone https://github.com/mcandre/rubycheck.git
$ cd rubycheck
$ bundle
```

## Test

### Logic

Ensure the code logic works as expected:

```
$ rake test
rspec
......

Finished in 0.36783 seconds
6 examples, 0 failures
```

### CLI

Ensure the example script works as expected:

```
$ bundle
$ cucumber
Feature: Run example tests

  Scenario: Running example tests            # features/run_example_tests.feature:3
    Given the program has finished           # features/step_definitions/steps.rb:1
    Then the output is correct for each test # features/step_definitions/steps.rb:5

1 scenario (1 passed)
2 steps (2 passed)
0m1.245s
```

## Lint

Keep the code base tidy:

```
$ rake lint
```

## Spell Check

```
$ aspelllint
...
```

## Local CI

Automatically check the code on file change:

```
$ guard
$ guard -G Guardfile-lint
```

## Git Hooks

See `hooks/`.
