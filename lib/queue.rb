require_relative "linked_list"

class Queue
  QUEUE_SIZE = 20

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Queue full"
    else
      @store[@rear] = element
      @rear = (@rear + 1) % QUEUE_SIZE
    end
  end

  def dequeue
    if @front == -1
      raise ArgumentError, "Queue empty"
    else
      front = @store[@front]
      @front = (@front + 1) % QUEUE_SIZE
      if @front == @rear
        @front = @rear = -1
      end
      return front
    end
  end

  def front
    return @front
  end

  def size
    return @store.size
  end

  def empty?
    @front == -1 ? true : false
  end

  def to_s
    array = []
    current = @front
    while current != @rear
      array << @store[current]
      current = (current + 1) % QUEUE_SIZE
    end
    return array.to_s
  end
end
