require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/queue'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Queue Implementation" do
  it "creates a Queue" do
    q = Queue.new
    q.class.must_equal Queue
  end

  it "adds something to an empty Queue" do
    q = Queue.new
    q.enqueue(10)
    q.to_s.must_equal "[10]"
  end

  it "adds multiple somethings to a Queue" do
    q = Queue.new
    q.enqueue(10)
    q.enqueue(20)
    q.enqueue(30)
    q.to_s.must_equal "[10, 20, 30]"
  end

  xit "starts the size of a Queue at 0" do
    skip
    q = Queue.new
    q.empty?.must_equal true
  end

  xit "removes something from the Queue" do
    skip
    q = Queue.new
    q.enqueue(5)
    removed = q.dequeue
    removed.must_equal 5
    q.empty?.must_equal true
  end

  xit "removes the right something (LIFO)" do
    skip
    q = Queue.new
    q.enqueue(5)
    q.enqueue(3)
    q.enqueue(7)
    removed = q.dequeue
    removed.must_equal 5
    q.to_s.must_equal "[3, 7]"
  end

  xit "properly adjusts the size with enqueueing and dequeueing" do
    skip
    q = Queue.new
    q.empty?.must_equal true
    q.enqueue(-1)
    q.enqueue(-60)
    q.empty?.must_equal false
    q.dequeue
    q.dequeue
    q.empty?.must_equal true
  end

  xit "returns the front element in the Queue" do
    skip
    q = Queue.new
    q.enqueue(40)
    q.enqueue(22)
    q.enqueue(3)
    q.dequeue
    expect(q.dequeue).must_equal 22
  end
end
