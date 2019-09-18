require_relative "linked_list"

class Stack
  def initialize
     @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    @store.remove_last()
  end

  def empty?
    last = @store.get_last()
    if last == nil
      return true
    else
      return false
    end
  end

  def to_s
    return @store.to_s
  end
end

