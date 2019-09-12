QUEUE_SIZE = 20

class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 # Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Q FULL"
    else # not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    dequeued = @store[@front]
    @store[@front] = nil

    self.size == 0 ? @front = @rear = -1 : @front = (@front + 1) % QUEUE_SIZE

    return dequeued
  end

  def front
    return @store[@front]
  end

  def size
    store = @store.select { |item| item != nil }
    return store.length
  end

  def empty?
    return true if @front == -1
    return false
  end

  def to_s
    store = @store.select { |item| item != nil }
    return store.to_s
  end
end
