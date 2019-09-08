QUEUE_SIZE = 20

class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1 
  end

  def enqueue(element) # add to rear
    if @front == -1 # Queue is empty 
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
    return @store
  end

  def dequeue # remove from front 
    removed = @store[@front] 
    @store[@front] = nil
    self.size == 0 ? @front = -1 : @front += 1
    return removed 
  end

  def front
    return @store[@front]
  end

  def size
    size = 0
    @store.each do |val|
      if !val.nil?
        size += 1
      end
    end
    return size
  end

  def empty?
    return true if self.size == 0
    return false
  end

  def to_string
    formatted_array = []
    @store.each do |x|
      if !x.nil?
        formatted_array << x
      end
    end
    return formatted_array.to_s
  end
end