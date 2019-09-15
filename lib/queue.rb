QUEUE_SIZE = 20

class Queue
  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 # Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear && !self.empty?
      raise Error, "Q IS FULL"
    else #not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    if @front == -1
      return nil
    end
    index_to_remove = @front
    value_to_remove = @store[index_to_remove]
    @store[index_to_remove] = nil
    @front += 1
    return value_to_remove
  end

  def front
    return store[@front]
  end

  def size
    size = 0
    return 0 if self.empty?
    
    @store.each do |i|
      if i != nil 
        size += 1
      end
    end

    return size
  end

  def empty?
    return true if self.to_s == "[]"
    return false
  end

  def to_s
    values = []
    @store.each do |i|
      if i != nil
        values << i
      end
    end

    return values.to_s
  end
end
