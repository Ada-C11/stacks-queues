class Queue
  #first in first out
  def initialize
    @store = Array.new(20)
    @queue_size = 20
    @front = -1
    @rear = -1 #-1 because it is not index in array, bc front and rear float around we dont know there will be any particular value
    #use -1 to indicate the queue is empty
  end

  def enqueue(element)
    if @front == -1 # queue is empty
      @front = 0
      @rear = 1
      @store[@front] = element
    elsif @front == @rear
      raise ArgumentError, "Queue full"
    else #not empty
      @store[@rear] = element
      @rear = (@rear + 1) % @queue_size #if we reach end of array we'll go back to 0 and wrap around
    end
  end

  def dequeue
    #fifo, remove first in
    if @front == -1
      raise ArgumentError, "Queue empty"
    else
      element = @store[@front]
      @front = (@front + 1) % @queue_size
      if @front == @rear #if queue is now empty
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
