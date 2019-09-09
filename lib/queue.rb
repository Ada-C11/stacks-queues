class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front = -1 #Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Q FULL"
    else #not empty
      #this is divisible by the Queue size because when rear reaches the end of the array then we want rear to wrap around and be at the beg of the array again (if the a.lenght is 10 , rear is at 9 then when we move rear + 1 (rear will be out range and thus (9+1)/10 = 0 will move rear back to 0)
      new_front = (@front + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    raise NotImplementedError, "Not yet implemented"
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.to_s
  end
end
