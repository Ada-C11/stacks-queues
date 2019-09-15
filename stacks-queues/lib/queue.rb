class Queue

  QUEUE_SIZE = 20
  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1
      @front = 0
      @rear = 1
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Queue is full"
    else # not empty, not full
      @store[@rear] = element
      @rear = (@rear + 1) % QUEUE_SIZE
    end
  end

  def dequeue
    if @front == -1
      raise Error, "Queue is empty"
    else
      dequeued = @store[@front]
      @front = (@front + 1) % QUEUE_SIZE
      if @front == @rear
        @front = @rear = -1
      end
      return dequeued
    end
  end

  def front
    if @front.empty?
     raise Error, "There is no front! There is no rear! Queue is empty"
    else
      return @store[@front]
    end
  end

  def size
    return @store[@front..@rear].length
  end

  def empty?
    if @front == -1
      return true 
    else
      return false
    end
  end

  def to_s
    elements_in_queue = []
    i = @front
    while i < @rear
      elements_in_queue << @store[i]
      i = (i + 1) % QUEUE_SIZE
    end
    return elements_in_queue.to_s
  end
end
