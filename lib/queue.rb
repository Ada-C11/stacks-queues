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
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    removed = @store[@front]
    if @front + 1 == @rear
      @front = -1
      @rear = -1
    else
      @store[@front] = nil
      @front = (@front + 1) % QUEUE_SIZE
    end
    return removed
  end

  def front
    if @store.empty?
      return -1
    else
      return @store[@front]
    end
  end

  def size
    return @store.size
  end

  def empty?
    return @front == -1
  end

  def to_s
    store_string = []
    @store.each do |num|
      if num != nil
        store_string << num
      end
    end
    return store_string.to_s
  end
end
