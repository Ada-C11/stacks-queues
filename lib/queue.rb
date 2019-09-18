class Queue

  class BufferFullError < StandardError; end

  def initialize(capacity=10)
    @capacity = capacity
    @store = Array.new(capacity)
    @head = @tail = 0
  end

  def enqueue(element)
    raise BufferFullError if (@tail == @head && !empty?) 
    @store[@tail] = element
    @tail = (@tail + 1) % @capacity
    
  end

  def dequeue
    return if !@head
    value = @store[@head]
    @store[@head] = nil 
    @head = (@head + 1) % @capacity
    return value
  end

  def front
    return @store[@head]
  end

  def size
    @store.count{|value| value}
  end

  def empty?
    @store.select{|value| value}.empty?
  end

  def to_s
    return @store.select{|value| value}.to_s
  end
end
