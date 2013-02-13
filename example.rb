#!/usr/bin/env ruby

require "rubycheck"

module RubyCheck
	def self.gen_even
		i = gen_int

		if i % 2 == 0
			i
		else
			i + 1
		end
	end
end

propEven = :even?

# Should fail.
RubyCheck::for_all(propEven, [:gen_int])

# Should pass.
RubyCheck::for_all(propEven, [:gen_even])

class String
	def reversible?
		this == reverse.reverse
	end
end

module RubyCheck
	def self.gen_palindrome
		s = gen_str
		s + s.reverse
	end
end

propReversible = :reversible?

# Should fail.
RubyCheck::for_all(propReversible, [:gen_str])

# Should pass.
RubyCheck::for_all(propReversible, [:gen_palindrome])