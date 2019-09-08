class Queue
  QUEUE_SIZE = 20

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1 #-1 because it is not index in array, bc front and rear float around we dont know there will be any particular value
    #use -1 to indicate the queue is empty
  end

  def enqueue(element)
    if @front == -1 # queue is empty
      @front = 0
      @rear = 0
      @store[@rear] = element
    elsif @front == (@rear + 1) % @store.length # queue is full
      raise Error, "Q full"
    else # queue not empty
      @rear += 1
      @store[@rear] = element
    end
  end

  def dequeue
    if @front == -1
      raise Error, "Q is empty"
    elsif @front == @rear
      removed_value = @store[@front]
      @store[@front] = nil
      @front = @rear = -1
      return removed_value
    else
      new_front = (@front + 1) % @store.length
      removed_value1 = @store[@front]

      @store[@front] = nil
      @front = new_front
      return removed_value1
    end
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
    return @store[@front..@rear].to_s
  end
end
