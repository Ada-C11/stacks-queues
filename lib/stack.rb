require_relative "linked_list.rb"

class Stack
  def initialize
    @store = LinkedList.new
    @top = nil
  end

  def push(element)
    #If using a linked list for a stack, is it really necessary to use a doubly linked list? Could you just use the add_first and remove_first methods of a single linked list?
    @top = @store.add_last(element)
  end

  def pop
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    # if @top.nil?
    #   return true
    # else
    #   return false
    # end

    return true if @top.nil?
    return false
  end

  def to_s
    return @store.to_s
  end
end
