QUEUE_SIZE = 20

class Queue
  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Queue full"
    else
      @store[@rear] = element
      new_rear = (@rear + 1) % QUEUE_SIZE
      @rear = new_rear
    end
  end

  def dequeue
    value = @store[@front]
    if @front + 1 == @rear # list will be empty
      @front = -1
      @rear = -1
    else
      @front = (@front + 1) % QUEUE_SIZE
    end
    return value
  end

  def front
    return @store[@front]
  end

  def size
    if @front <= @rear
      return @rear - @front
    else
      return (@store.length - @front) + @rear
    end
  end

  def empty?
    if @front == -1
      return true
    end
    return false
  end

  def to_s
    if @front < @rear
      @store = @store[@front...@rear]
    else
      @store = @store[@front..-1].concat(@store[0...@rear])
    end
    return @store.to_s
  end
end
