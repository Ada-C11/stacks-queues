class Queue
  QUEUE_SIZE = 20

  def initialize
    @store = [Array.new(QUEUE_SIZE)]
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 #if front is empty
      @rear = 1
      @front = 0

      @store[@front] = element
    elsif @front == @rear
      raise Error, "queue full!"
    else
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    removed = @store[@front]
    @store[@front] = nil

    if (@front + 1) == @rear
      @front = @rear = -1
    else
      @front = (@front + 1) % QUEUE_SIZE
    end

    return removed
  end

  def front
    return @store[@front]
  end

  def size
    filled_spots = @store.select { |val| val != nil }
    return filled_spots.length
  end

  def empty?
    if @front == -1
      return true
    else
      return false
    end
  end

  def to_s
    adjusted_store = @store.select { |val| val != nil }

    return adjusted_store.to_s
  end
end
