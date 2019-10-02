class Queue
  QUEUE = 20

  def initialize
    @store = Array.new(QUEUE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Queue Full"
    else
      new_rear = (@rear + 1) % QUEUE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    raise Error, "Queue Empty" if @front == -1
    value = @store[@front]
    @store[@front] = nil
    @front = (@front + 1) % QUEUE
    @front = @rear = -1 if @front == @rear
    return value
  end

  def front
    rreturn @store[@head]
  end

  def size
    if (@head == @tail && !empty?)
      return @capacity 
    elsif @head == @tail
      return 0
    elsif @tail > @head
      return @tail - @head
    elsif @tail < @head
      return @capacity - (@head - @tail)
    end
  end

  def empty?
    return @rear == -1
  end

  def to_s
    return @store[@front...@rear].to_s
  end
end
