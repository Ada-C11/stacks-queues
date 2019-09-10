require "linked_list.rb"

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    removed = @store.remove_last
    return removed
  end

  def empty?
    if @store.length >  0
      return false
    else
      return true
    end
  end

  def to_s
    return @store.to_s
  end
end
