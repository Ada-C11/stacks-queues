require 'pry'

class Queue

  def initialize
    @limit = 4 # item limit for queue
    @size = @limit + 1 # size of the internal array
    @internal_array = Array.new(@size)
    @front = 0
    @back = 0
  end

  def enqueue(element)
    return "Stack is full" if @front == (@back + 1) % @internal_array.length

    @internal_array[@back] = element

    @back = (@back + 1) % @internal_array.size
  end

  def dequeue
    return nil if self.empty?

    temp = @internal_array[@front]
    @front = (@front + 1) % @size

    return temp
  end

  def front
    @front = (@front + 1) % @size
  end

  def size
    return @internal_array.size
  end

  def empty?
    return @front == @back
  end

  def to_s
    i = @front
    print_array = []
    while i < @back
        if !@internal_array[i].nil?
          print_array << @internal_array[i]
        end
      i += 1
    end
    return print_array.to_s
  end
end
