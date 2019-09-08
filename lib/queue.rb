QUEUE_SIZE = 20

class Queue
  def initialize
    @store = Array.new(QUEUE_SIZE)
    # starting as -1 because nothing is in the queue yet
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1
      @front = 0
      @rear = 1
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Q FULL"
    else
      new_rear = (@rear + 1) % QUEUE_SIZE # if we reach the end of the array it will wrap around to the beginning again...
      @store[@rear] = element
      @rear = new_rear
    end

    return @store
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
    return true if @store[@front].nil?
  end

  def to_s
    new_store = @store.select { |num| num != nil }
    return new_store.to_s
  end
end
