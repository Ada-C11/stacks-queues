QUEUE_SIZE = 20
class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1
      @front = 0
      @rear = 1
      @store[@front] = element
    elsif @front == (@rear + 1) % QUEUE_SIZE
      raise Error, "Queue is full"
    else
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element 
      @rear = new_rear 
    end
  end

  def dequeue
    if @front == @rear
      @front = @rear = -1
      raise Error, "Queue is empty"
    else
      new_front = (@front + 1) % QUEUE_SIZE
      old_front = @store[@front]
      @store[@front] = nil
      @front = new_front
      return old_front
    end
  end

  def front
    return @strore[@front]
  end

  def size
    return @store.length
  end

  def empty?
    if @store[@front...@rear].length == 0 
      return true
    else 
      return false
    end
  end

  def to_s
    return @store[@front...@rear].to_s
  end
end
