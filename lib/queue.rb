QUEUE_SIZE = 16

class Queue

  def initialize
      @store = Array.new(QUEUE_SIZE)
      @front = nil
      @rear = nil
      # setting these to nil because in Ruby -1 also represents the end of the array
  end

  def enqueue(element)
    if @front == nil
      @front = 0
      @rear = 1
      @store[@front] = element
    elsif @front == @rear
      raise Error, "The queue is full."
    else
      @store[@rear] = element
      @rear = (@rear + 1) % QUEUE_SIZE
    end
  end

  def dequeue
    remove_item = @store[@front]

    raise Error, "The queue is empty." if empty?

    @store[@front] = nil
    @front = (@front + 1) % QUEUE_SIZE

    return remove_item
  end

  # def front
  #   raise NotImplementedError, "Not yet implemented"
  # end

  # def size
  #   raise NotImplementedError, "Not yet implemented"
  # end

  def empty?
    return (@front == nil && @rear == nil) || (@front == @rear)
  end


# def to_s
#   @store.to_s
# end

  def to_s
    array_as_string = "["
    if @store[@front]
      array_as_string = array_as_string + "#{@store[@front]}"
    end

    i = @front + 1
    until i == @rear
      array_as_string = array_as_string + ", #{@store[i]}"
      i += 1
    end

    array_as_string = array_as_string + "]"
    return array_as_string
  end
end
