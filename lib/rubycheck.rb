# Returns a random integer from 0 to 10^10 - 1.
def gen_int
	Random::rand(10e10).to_i
end

# Returns a random byte.
def gen_byte
	gen_int % 256
end

# Returns a random ASCII character.
def gen_char
	(gen_int % 128).chr
end

# Returning a random array given a value generator.
def gen_array(gen)
	len = gen_int % 100

	0.upto(len).collect { |i| gen.call }
end

# Returns a random string.
def gen_str
	gen_char_lambda = Proc.new { gen_char }

	gen_array(gen_char_lambda).join("")
end

# Evaluates property over 100 random unit tests,
# with argument values specified in generators.
def for_all(property, generators)
	# ...
end