require 'rubycheck'

describe RubyCheck, "#gen_float" do
  it "generates random floats" do
    RubyCheck::gen_float.class.should == Float

    1.upto(100).collect { |i| RubyCheck::gen_int }.uniq.length.should > 10
  end
end

describe RubyCheck, "#gen_int" do
  it "generates random integers" do
    RubyCheck::gen_int.class.should == Fixnum

    1.upto(100).collect { |i| RubyCheck::gen_int }.uniq.length.should > 10
  end
end

describe RubyCheck, "#gen_byte" do
  it "generates random bytes" do
    RubyCheck::gen_byte.class.should == Fixnum

    1.upto(100).collect { |i| RubyCheck::gen_byte }.reject { |b| b < 0 || b > 255 }.length.should == 100

    1.upto(100).collect { |i| RubyCheck::gen_byte }.uniq.length.should > 10
  end
end

describe RubyCheck, "#gen_char" do
  it "generates random characters" do
    RubyCheck::gen_char.class.should == String

    1.upto(100).collect { |i| RubyCheck::gen_char }.reject { |c| c.length != 1 }.length.should == 100

    1.upto(100).collect { |i| RubyCheck::gen_char }.uniq.length.should > 10
  end
end

describe RubyCheck, "#gen_array" do
  it "generates random arrays" do
    RubyCheck::gen_array(:gen_int).class.should == Array

    RubyCheck::gen_array(:gen_int).reject { |e| e.class != Fixnum }.length.should > 0

    1.upto(100).collect { |i| RubyCheck::gen_array(:gen_int) }.uniq.length.should > 10
  end
end

describe RubyCheck, "#gen_str" do
  it "generates random strings" do
    RubyCheck::gen_str.class.should == String

    1.upto(100).collect { |i| RubyCheck::gen_str }.reject { |s| s.class != String }.length.should == 100

    1.upto(100).collect { |i| RubyCheck::gen_str }.uniq.length.should > 10
  end
end

describe RubyCheck, "#for_all" do
  it "should check properties" do
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

    RubyCheck.for_all(prop_even, [:gen_int]).class.should == Array

    RubyCheck.for_all(prop_even, [:gen_even]).should == true

    module RubyCheck
      def self.gen_palindrome
        s = gen_str
        s + s.reverse
      end
    end

    prop_palindrome = -> s { s == s.reverse }

    RubyCheck.for_all(prop_palindrome, [:gen_str]).class.should == Array

    RubyCheck.for_all(prop_palindrome, [:gen_palindrome]).should == true
  end
end
