class Queue
  QUEUE_SIZE = 20

  def initialize
    # @store = ..
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 # Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Q Full"
    else # not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    raise Error, "Q Empty" if @front == -1
    value = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % QUEUE_SIZE
    @front = @rear = -1 if @front == @rear
    return value
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @rear == -1
  end

  def to_s
    return @store[@front...@rear].to_s
  end
end
