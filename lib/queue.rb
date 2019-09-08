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
    elsif (@rear + 1) % QUEUE_SIZE == @front
      raise ArgumentError, "Q FULL"
    else
      new_rear = (@rear + 1) % QUEUE_SIZE # if we reach the end of the array it will wrap around to the beginning again...
      @store[@rear] = element
      @rear = new_rear
    end

    return @store
  end

  def dequeue
    if @front == -1
      return
    elsif @front == @rear
      temp = @store[@front]
      @front = -1
      @rear = -1
      return temp
    else
      temp = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % QUEUE_SIZE
      return temp
    end

    @front -= 1 if @store[@front].nil? && @store == @rear
  end

  def front
    return @store[@front]
  end

  def size
    return @front > @rear ? (QUEUE_SIZE - @front + @rear) : (@rear - @front)
  end

  def empty?
    return @store[@front].nil? ? true : false
  end

  def to_s
    new_store = @store.select { |num| num != nil }
    return new_store.to_s
  end
end
