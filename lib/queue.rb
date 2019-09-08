class Queue
  QUEUE_SIZE = 20

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 # empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise Error, "Q Full"
    else
      #not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    if @front == -1
      return nil
    elsif @front == @rear
      raise Error, "Q Full"
    else
      new_front = (@front + 1) % QUEUE_SIZE
      temp = @store[@front]
      @store[@front] = nil
      @front = new_front
    end
    return temp
  end

  def front
    return @front
  end

  def size
    count = 0
    @store.each do |elem|
      if !elem.nil?
        count += 1
      end
    end
    return count
  end

  def empty?
    if size > 0
      return false
    end
    return true
  end

  def to_s
    array_with_values = []
    @store.each do |elem|
      if !elem.nil?
        array_with_values.append(elem)
      end
    end
    return array_with_values.to_s
  end
end
