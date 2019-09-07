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
      raise Error, "Q is full"
    else # not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    element = @store[@front]
    @store[@front] = nil

    if @store[@front + 1] == nil
      return element
    else
      @front += 1
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
    return @store[0] == nil && @store[1] == nil
  end

  def to_s
    store = Array.new

    @store.each_with_index do |element, i|
      next if i < @front
      break if element.nil?
      store << element
    end

    return store.to_s
  end
end
