QUEUE_SIZE = 20

class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 #Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise ArgumentError, "Queue is full"
    else
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    if @front == -1 
      raise ArgumentError, "Queue is empty"
    else
      dequeued = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % QUEUE_SIZE
      return dequeued
    end
  end

  def front
    return @store[@front]
  end

  def size
    return @store.compact.length
  end

  def empty?
    queue = @store.compact
    if queue.length == 0
      return true
    else
      return false
    end
  end

  def to_s
    return @store.compact.to_s
  end
end
