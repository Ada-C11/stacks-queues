require_relative "linked_list"

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    @store.remove_last
  end

  def empty?
    return true if length = 0
  end

  def to_s
    return @store.to_s
  end
end
