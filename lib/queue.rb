class Queue

  def initialize
    @store = Array.new(10)
    @front = @rear = -1
    @size = 0
    @capacity = 10
  end

  def enqueue(element)
    if @size == @capacity
    return
    else
      if @front == -1
        @front = 0
      end
      @rear = (@rear + 1) % @capacity
      @store[@rear] = element
      @size += 1
    end
  end

  def dequeue 
    if empty?
      return
    elsif @front == @rear
      removed_element = @store[@front]
      @front = -1
      @rear = -1
      @size -= 1
      return removed_element
    else
      removed_element = @store[@front]
      @front = (@front + 1) % @capacity
      @size -= 1
      return removed_element
    end
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    if @size == 0
      return true
    else
      return false
    end
  end

  def to_s
    if @size == 0
      return [].to_s
    elsif @front <= @rear
      return @store[@front..@rear].to_s
    else
      new_array = @store[@front .. @capacity -1] + @store[0..@rear]
      return new_array.to_s
    end
  end
end
