require_relative "linked_list"

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    temp = @store.get_last
    @store.remove_last
    return temp
  end

  def peek
    return @store.get_last
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
