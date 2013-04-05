module RubyCheck
  # Returns a random integer from 0 to 10^10 - 1.
  def self.gen_int
    Random::rand(10e10).to_i
  end

  # Returns a random byte.
  def self.gen_byte
    gen_int % 256
  end

  # Returns a random ASCII character.
  def self.gen_char
    (gen_int % 128).chr
  end

  # Returning a random array given a value generator.
  def self.gen_array(gen_sym)
    len = gen_int % 100

    0.upto(len).collect { |i| self.send(gen_sym) }
  end

  # Returns a random string.
  def self.gen_str
    gen_array(:gen_char).join("")
  end

  # Evaluates property over 100 random unit tests,
  # with argument values specified in generators.
  def self.for_all(property, gen_syms)
    trials = 100

    passed_all = true

    0.upto(trials - 1) { |i|
      test_case = gen_syms.collect { |gen_sym| self.send(gen_sym) }

      property_holds = property.call(*test_case)

      if not property_holds
        puts "*** Failed!"
        puts test_case
        false
      end
    }

    puts "+++ OK, passed #{trials} tests."

    true
  end
end
