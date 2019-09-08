QUEUE_SIZE = 20

class Queue

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  # using circular buffer
  def enqueue(element)
    if @front == -1 # Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element

    elsif @front == @rear
      raise Error, "Queue is full."

    else # not empty
       # if we reach the end of the array, rear will once again be pointed to 0
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    if @front == -1
      return

    elsif @front == @rear
      temp_node = @store[@front]
      @front = -1
      @rear = -1
      return temp_node

    else
      temp_node = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % QUEUE_SIZE
      return temp_node
    end
  end

  def front
    return @store[@front]
  end

  def size
    if @front > @rear
      return QUEUE_SIZE - @front + @rear
    else
      return @rear - @front
    end
  end

  def empty?
   if @store[@front].nil?
      return true
   else
    return false
   end
  end

  def to_s
    array = []
    @store.each do |element|
      break if element.nil?

      array << element
    end
    return array.to_s
  end
end
