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
    elsif @front == @rear
      raise Error, "Q is full"
    else # not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    element = @store[@front]
    @store[@front] = nil

    if @store[@front + 1] == nil
      return element
    else
      @front += 1
    end

    return element
  end

  def front
    return nil if @store.empty?

    first_element = self.dequeue
    temp_array = [first_element]

    until self.empty?
      temp_element = self.dequeue
      temp_array << temp_element
    end

    i = 0

    until i == temp_array.length
      self.enqueue(temp_array[i])
      i += 1
    end

    return first_element
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    @front = -1 if @store[@front].nil?
    return @store[@front].nil?
  end

  def to_s
    store = Array.new

    @store.each_with_index do |element, i|
      next if i < @front
      break if element.nil?
      store << element
    end

    return store.to_s
  end
end
