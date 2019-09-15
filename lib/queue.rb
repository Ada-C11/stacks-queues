class Queue

  def initialize
    @BUFFER_SIZE = 10
    @store = []
    @front = -1
    @rear = -1 
  end

  def enqueue(element)
    if @front == 0 && @rear == @BUFFER_SIZE - 1
      raise Error, "Queue is Full"
    elsif @front == -1
      @front = 0
      @rear = 0
      @store[@rear] = element
    elsif @rear == @store.length - 1 && @front != 0
      @rear = 0
      @store[@rear] = element
    else
      @rear += 1
      @store[@rear] = element
    end
  end

  def dequeue
    removed_data = @store[@front]
    @store[@front] = nil
    if (@front == @rear)
      @front = -1
      @rear = -1
    elsif @front === @BUFFER_SIZE - 1
      @front = 0
    else
      @front += 1
    end
    return removed_data
  end

  def front
    return @store[@front]
  end

  def size
    return @store.length
  end

  def empty?
    if @front == -1
      return true
    end
    return false
  end

  def to_s
    display_store = []
    if @front <= @rear
      display_store = @store[@front...@rear+1]
    else
      first_half = @store[0...@rear]
      second_half = @store[@front..@store.length+1]
      display_store.push(first_half)
      display_store.push(second_half)
    end
    return display_store.to_s
  end

end