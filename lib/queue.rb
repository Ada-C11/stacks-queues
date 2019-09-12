require_relative "./linked_list.rb"

class Queue
  def initialize(length=nil)
    @store = LinkedList.new
    @size = 0
  end

  def enqueue(element)
    @store.add_last(element)
    @size += 1
    return @store
  end

  def dequeue
    @size -= 1
    return @store.remove_first()
  end

  def front
    return @store.get_first()
  end

  def size
    return @size
  end

  def empty?
    return @size == 0
  end

  def to_s
    str_q = []
    while !@store.empty?
      value = @store.remove_first()
      str_q << value
    end
    return str_q.to_s
  end
end
