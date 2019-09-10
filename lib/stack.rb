require_relative "linked_list.rb"

class Stack
  def initialize
    @store = LinkedList.new
    # @top = nil
  end

  def push(element)
    #If using a linked list for a stack, is there a disadvantage to using a singly linked list and use the add_first method for push and remove_first method for pop?
    @store.add_last(element)
  end

  def pop
    @store.remove_last()
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
