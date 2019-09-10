require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/stack'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Stack Implementation" do
  it "creates a Stack" do
    s = Stack.new(3)
    s.class.must_equal Stack
  end

  it "pushes something onto a empty Stack" do
    s = Stack.new(3)
    s.push(10)
    s.to_s.must_equal "[10]"
  end

  it "pushes multiple somethings onto a Stack" do
    s = Stack.new(3)
    s.push(10)
    s.push(20)
    s.push(30)
    s.to_s.must_equal "[10, 20, 30]"
  end

  it "raises Stack Overlow ;)"do
    s = Stack.new(3)
    s.push(1)
    s.push(2)
    s.push(3)
    s.to_s.must_equal "[1, 2, 3]"
    s.push(4).must_equal "Stack Overflow" #change this
  end

  it "starts the stack empty" do
    s = Stack.new(3)
    s.empty?.must_equal true
  end

  it "removes something from the stack" do
    s = Stack.new(3)
    s.push(5)
    removed = s.pop
    removed.must_equal 5
    s.empty?.must_equal true
  end

  it "removes the right something (LIFO)" do
    s = Stack.new(3)
    s.push(5)
    s.push(3)
    s.push(7)
    removed = s.pop
    removed.must_equal 7
    s.to_s.must_equal "[5, 3]"
  end
end