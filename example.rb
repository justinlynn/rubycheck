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

propEven = Proc.new { |n| n.even? }

# Should fail.
RubyCheck::for_all(propEven, [:gen_int])

# Should pass.
RubyCheck::for_all(propEven, [:gen_even])

module RubyCheck
	def self.gen_palindrome
		s = gen_str
		s + s.reverse
	end
end

propPalindrome = Proc.new { |s| s == s.reverse }

# Should fail.
RubyCheck::for_all(propPalindrome, [:gen_str])

# Should pass.
RubyCheck::for_all(propPalindrome, [:gen_palindrome])