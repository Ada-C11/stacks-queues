QUEUE_SIZE = 20

class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  # using circular buffer
  def enqueue(element)
    if @front == -1 # Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element

    elsif @front == @rear
      raise Error, "Queue is full."

    else # not empty
       # if we reach the end of the array, rear will once again be pointed to 0
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    return element = @store.pop
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @store[0] == nil && @store[1] == nil
  end

  def to_s
    array = []
    @store.each do |element|
      break if element.nil?

      array << element
    end
    return array.to_s
  end
end
