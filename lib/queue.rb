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
    if @front == -1 # Q is empty
      return

    elsif @front == @rear #  There's only 1 element
      temp_node = @store[@front] # "remove" the element
      @front = -1 # points to the empty bucket
      @rear = -1 # points to the empty bucket
      return temp_node

    else # there's more than 1 element in the array
      temp_node = @store[@front] # "remove" the element
      @store[@front] = nil # store is now empty
      @front = (@front + 1) % QUEUE_SIZE # wrap front around array
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
    @store.each_with_index do |element, i|
      next if i < @front
      break if element.nil?

      array << element
    end
    return array.to_s
  end
end
