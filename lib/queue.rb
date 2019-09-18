# QUEUE_SIZE = 20
class Queue
  def initialize
    @store = Array.new(20)
    @queue_size = 20
    @front = @rear = -1
  end

  def enqueue(element)
    # raise NotImplementedError, "Not yet implemented"
    if @front == -1 #Q is empty
      @front = 0
      @rear = 1
      @store[@front] = element
    elsif @front == @rear
      raise ArgumentError, "Q FULL"
    else #not empty
      @store[@rear] = element
      @rear = (@rear + 1) % @queue_size
    end
  end

  def dequeue
    if @front == -1
      reise ArgumentError, "Queue empty"
    else
      element = @store[@front]
      @front = (@front + 1) % @queue_size
      if @front == @rear
        @front = -1
        @rear = -1
      end
    end
    return element
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    if @front == -1
      return true
    else
      return false
    end
  end

  def to_s
    list = []
    current = @front
    while current != @rear
      list << @store[current]
      current = (current + 1) % @queue_size
    end
    return list.to_s
  end
end

