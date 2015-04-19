require 'rubycheck'

describe RubyCheck, '#gen_float' do
  it 'generates random floats' do
    expect(RubyCheck.gen_float.class).to eq(Float)

    expect(1.upto(100).map { || RubyCheck.gen_float }.uniq.length).to be > 10
  end
end

describe RubyCheck, '#gen_int' do
  it 'generates random integers' do
    expect(RubyCheck.gen_int.class).to eq(Fixnum)

    expect(1.upto(100).map { || RubyCheck.gen_int }.uniq.length).to be > 10
  end
end

describe RubyCheck, '#gen_byte' do
  it 'generates random bytes' do
    expect(RubyCheck.gen_byte.class).to eq(Fixnum)

    expect(1.upto(100).map { || RubyCheck.gen_byte }.reject { |b| b < 0 || b > 255 }.length).to eq(100)

    expect(1.upto(100).map { || RubyCheck.gen_byte }.uniq.length).to be > 10
  end
end

describe RubyCheck, '#gen_char' do
  it 'generates random characters' do
    expect(RubyCheck.gen_char.class).to eq(String)

    expect(1.upto(100).map { || RubyCheck.gen_char }.reject { |c| c.length != 1 }.length).to eq(100)

    expect(1.upto(100).map { || RubyCheck.gen_char }.uniq.length).to be > 10
  end
end

describe RubyCheck, '#gen_array' do
  it 'generates random arrays' do
    expect(RubyCheck.gen_array(:gen_int).class).to eq(Array)

    expect(RubyCheck.gen_array(:gen_int).reject { |e| e.class != Fixnum }.length).to be > 0

    expect(1.upto(100).map { || RubyCheck.gen_array(:gen_int) }.uniq.length).to be > 10
  end
end

describe RubyCheck, '#gen_str' do
  it 'generates random strings' do
    expect(RubyCheck.gen_str.class).to eq(String)

    expect(1.upto(100).map { || RubyCheck.gen_str }.reject { |s| s.class != String }.length).to eq(100)

    expect(1.upto(100).map { || RubyCheck.gen_str }.uniq.length).to be > 10
  end
end

describe RubyCheck, '#for_all' do
  it 'should check properties' do
    module RubyCheck
      def self.gen_even
        i = gen_int

        if i.even?
          i
        else
          i + 1
        end
      end
    end

    prop_even = -> n { n.even? }

    expect(RubyCheck.for_all(prop_even, [:gen_int]).class).to eq(Array)

    expect(RubyCheck.for_all(prop_even, [:gen_even])).to be true

    module RubyCheck
      def self.gen_palindrome
        s = gen_str
        s + s.reverse
      end
    end

    prop_palindrome = -> s { s == s.reverse }

    expect(RubyCheck.for_all(prop_palindrome, [:gen_str]).class).to eq(Array)

    expect(RubyCheck.for_all(prop_palindrome, [:gen_palindrome])).to be true
  end
end
