class Queue
  QUEUE_SIZE = 20

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
      raise Error, "Q FULL"
    else
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    if @front == -1
      return
    else
      @front += 1
      removed = @store[@front - 1]
      @store[@front - 1] = nil
      return removed
    end
  end

  def front
    return @store[@front]
  end

  def size
    array_store = @store.select { |val| val != nil }
    return array_store.length
  end

  def empty?
    return (@front == @rear) && (@store[@front] == nil)
  end

  def to_s
    to_string_store = @store.select { |val| val != nil }
    return to_string_store.to_s
  end
end
