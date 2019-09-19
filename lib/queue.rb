class Queue

  QUEUE_SIZE = 10

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
      raise Error, "Q Full"
    else # not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end	 

  def dequeue
    if @front == -1 && @rear == -1 # Q is empty
      raise Error, "Q Empty"
    elsif @store[@front +1] == nil # Q has one item and becomes empty
      removed = @store[@front]
      @store[@front] = nil
      @front = -1
      @rear = -1
      return removed
    else
      removed = @store[@front]
      @store[@front] = nil
      @front = @front + 1
      return removed
    end
  end

  def front
    return @front
  end

  def size
    return @store.length
  end

  def empty?
    if @front == -1 && @rear == -1
      return true
    else
      return false
    end
  end

  def to_s
    return @store[@front...@rear].to_s
  end
end
