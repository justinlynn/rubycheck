require_relative 'version'

require 'contracts'
include Contracts

#
# RubyCheck - a Ruby port of the QuickCheck unit test framework
#
# See http://www.yellosoft.us/quickcheck for an introduction to QuickCheck property testing.
#
# RubyCheck defines test case generators for several basic Ruby types,
# and encourages monkeypatching for defining generators for custom types.
#
module RubyCheck
    Contract nil => Bool
    #
    # Generate a random boolean.
    #
    # Example:
    #
    #   RubyCheck::gen_bool
    #   => false
    #
    def self.gen_bool
        Random.rand < 0.5
    end

    Contract nil => Float
    #
    # Generate a random float in [0, 10^10 - 1].
    #
    # Example:
    #
    #   RubyCheck::gen_float
    #   => 0.223
    #
    def self.gen_float
        Random.rand(10e10)
    end

    Contract nil => Integer
    #
    # Generate a random unsigned integer in [0, 10^10 - 1].
    #
    # Example:
    #
    #   RubyCheck::gen_uint
    #   => 4
    #
    def self.gen_uint
        Random.rand(10e10).to_i
    end

    Contract nil => Integer
    #
    # Generate a random unsigned integer in [0, 2^16 - 1].
    #
    # Example:
    #
    #   RubyCheck::gen_uint16
    #   => 4
    #
    def self.gen_uint16
        Random.rand(65535).to_i
    end

    Contract nil => Integer
    #
    # Generate a random integer in [(-1 * 10^10) + 1, 10^10 - 1].
    #
    # Example:
    #
    #   RubyCheck::gen_int
    #   => -4
    #
    def self.gen_int
        i = Random.rand(10e10).to_i

        if gen_bool
            i
        else
            i * -1
        end
    end

    Contract nil => Integer
    #
    # Generate a random byte in [0, 255].
    #
    # Example:
    #
    #   RubyCheck::gen_byte
    #   => 96
    #
    def self.gen_byte
        gen_uint % 256
    end

    Contract nil => String
    #
    # Generate a random ASCII character.
    #
    # Example:
    #
    #   RubyCheck::gen_char
    #   => "Q"
    #
    def self.gen_char
        (gen_uint % 128).chr
    end

    Contract Symbol => Array
    #
    # Generate a random array, populated with values generated with <i>gen_sym</i>.
    #
    # Example:
    #
    #   RubyCheck::gen_array(:gen_uint)
    #   => [1, 3, 3, 7]
    #
    def self.gen_array(gen_sym)
        len = gen_uint % 100

        0.upto(len).map { || send(gen_sym) }
    end

    Contract nil => String
    #
    # Generate a random ASCII string.
    #
    # Example:
    #
    #   RubyCheck::gen_str
    #   => "qwerty123!@#"
    #
    def self.gen_str
        gen_array(:gen_char).join('')
    end

    # Number of test cases to generate per <i>for_all</i> run
    TRIALS = 10_000

    #
    # Defines an error class to capture test case input
    # when reporting errors observed by <i>for_all</i>.
    #
    class PropertyFailure < RuntimeError
        # Input values that caused a test property to fail
        attr_accessor :test_case

        Contract Array => Array
        #
        # Construct a PropertyFailure error, collecting <i>test_case</i> input data.
        #
        # Example:
        #
        #   RubyCheck::PropertyFailure.new([9])
        #   => #<RubyCheck::PropertyFailure: RubyCheck::PropertyFailure>
        #
        def initialize(test_case)
            @test_case = test_case
        end
    end

    Contract Proc, ArrayOf[Symbol] => Or[Bool, Array]
    #
    # Evaluates <i>property</i>, <i>TRIALS</i> times, over random inputs generated by <i>gen_syms</i>.
    #
    # Returns <i>true</i>, or the first failing test case.
    #
    # Example:
    #
    #   RubyCheck::for_all( ->(i) { i.even? }, [:gen_uint])
    #   => [9]
    #
    #   RubyCheck::for_all( ->(i) { i.even? || i.odd? }, [:gen_uint])
    #   => true
    #
    def self.for_all(property, gen_syms)
        TRIALS.times do ||
            test_case = gen_syms.map { |gen_sym| send(gen_sym) }
            fail PropertyFailure.new(test_case), 'test case error' unless property.call(*test_case)
        end
    rescue PropertyFailure => e
        e.test_case
    else
        true
    end
end
