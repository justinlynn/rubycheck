# rubycheck - a Ruby port of the QuickCheck unit test framework

# EXAMPLE

    $ rake test
    bundle exec ruby example.rb
    *** Failed!
    70300761523
    +++ OK, passed 100 tests.
    *** Failed!
    _5E(V$/\7☺P:x}m;MoQ↓6i↔
    +++ OK, passed 100 tests.

# HOMEPAGE

http://www.yellosoft.us/quickcheck

# INSTALL

    $ gem install rubycheck

# LICENSE

FreeBSD

# DEVELOPMENT

Checkout the code, and install the dependencies:

    $ git clone https://github.com/mcandre/rubycheck.git
    $ cd rubycheck
    $ bundle

## Testing

Ensure the example script works as expected:

    $ bundle
    $ cucumber
    Feature: Run example tests

      Scenario: Running example tests            # features/run_example_tests.feature:3
        Given the program has finished           # features/step_definitions/steps.rb:1
        Then the output is correct for each test # features/step_definitions/steps.rb:5

    1 scenario (1 passed)
    2 steps (2 passed)
    0m1.245s

## Linting

Keep the code base tidy:

    $ rake lint
