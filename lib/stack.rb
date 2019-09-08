require_relative "./linked_list"

class Stack
  def initialize
    @store = LinkedList.new
    @top = nil
  end

  def push(element)
    @store.add_last(element)
    @top = element
  end

  def pop
    @store.remove_last
  end

  def peek
    return @top
  end

  def size
    return @store.length
  end

  def empty?
    return @store.get_last.nil?
  end

  def to_s
    return @store.to_s
  end
end
