# Returns a random integer from 0 to 10^10 - 1.
def gen_int
	Random::rand(10e10).to_i
end

# Returns a random byte.
def self.gen_byte
	gen_int % 256
end

def self.gen_char
	# ...
end

def self.gen_array(gen)
	# ...
end

def self.gen_str
	# ...
end

def for_all(property, generators)
	# ...
end