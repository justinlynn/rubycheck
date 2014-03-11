require 'version'

require 'contracts'
include Contracts

#
# RubyCheck - a Ruby port of the QuickCheck unit test framework
#
# RubyCheck defines test case generators for several basic Ruby types,
# and encourages monkeypatching for generating custom types.
#
module RubyCheck
  Contract nil => Num
  # Returns a random integer from 0 to 10^10 - 1.
  def self.gen_int
    Random.rand(10e10).to_i
  end

  Contract nil => Num
  # Returns a random byte.
  def self.gen_byte
    gen_int % 256
  end

  Contract nil => Num
  # Returns a random ASCII character.
  def self.gen_char
    (gen_int % 128).chr
  end

  Contract Proc => Array
  # Returning a random array given a value generator.
  def self.gen_array(gen_sym)
    len = gen_int % 100

    0.upto(len).map { |i| send(gen_sym) }
  end

  Contract nil => String
  # Returns a random string.
  def self.gen_str
    gen_array(:gen_char).join('')
  end

  # Number of test cases to generate per <i>for_all</i> run
  TRIALS = 10000

  # Used by for_all to detect property failures.
  class PropertyFailure < RuntimeError
    attr_accessor :test_case

    Contract Array => Array
    # Create a propterty failure error message
    def initialize(test)
      @test_case = test
    end
  end

  Contract Proc, ArrayOf[Proc] => Bool
  #
  # Evaluates property over 100 random unit tests, with argument values specified in generators.
  # Returns true, or the failing test case.
  #
  def self.for_all(property, gen_syms)
    0.upto(TRIALS - 1).each do |i|
      test_case = gen_syms.map { |gen_sym| send(gen_sym) }
      fail PropertyFailure.new(test_case), 'test case error' unless property.call(*test_case)
    end
  rescue PropertyFailure => e
    e.test_case
  else
    true
  end
end
