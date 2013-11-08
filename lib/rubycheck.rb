require 'contracts'
include Contracts

#
# RubyCheck
#
module RubyCheck
  VERSION = '0.0.1'

  # Returns a random integer from 0 to 10^10 - 1.
  Contract nil => Num
  def self.gen_int
    Random.rand(10e10).to_i
  end

  # Returns a random byte.

  Contract nil => Num
  def self.gen_byte
    gen_int % 256
  end

  # Returns a random ASCII character.

  Contract nil => Num
  def self.gen_char
    (gen_int % 128).chr
  end

  # Returning a random array given a value generator.

  Contract Proc => Array
  def self.gen_array(gen_sym)
    len = gen_int % 100

    0.upto(len).map { |i| send(gen_sym) }
  end

  # Returns a random string.
  def self.gen_str
    gen_array(:gen_char).join('')
  end

  TRIALS = 100

  # Used by for_all to detect property failures.
  class PropertyFailure < RuntimeError
    attr_accessor :test_case

    Contract Array => Array
    def initialize(test)
      @test_case = test
    end
  end

  # Evaluates property over 100 random unit tests,
  # with argument values specified in generators.

  Contract Proc, ArrayOf[Proc] => Bool
  def self.for_all(property, gen_syms)
    [0 .. TRIALS - 1].each do |i|
      test_case = gen_syms.map { |gen_sym| send(gen_sym) }
      fail PropertyFailure.new(test_case), 'test case error' unless property.call(*test_case)
    end
  rescue PropertyFailure => e
    puts "*** Failed!\n#{e.test_case}"
    false
  else
    puts "+++ OK, passed #{TRIALS} tests."
    true
  end
end
