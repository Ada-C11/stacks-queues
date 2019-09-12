require_relative "./linked_list.rb"

class Queue
  def initialize
    @store = LinkedList.new
  end

  def enqueue(element)
    @store.add_last(element)
  end

  def dequeue
    @store.remove_first
  end

  def front
    return @store.head
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
