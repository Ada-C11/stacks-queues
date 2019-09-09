require_relative './linked_list.rb'

class Stack
  def initialize
    @store = LinkedList.new
    @top = nil
  end

  def push(element)
    @store.add_last(element)
  end

  def pop
    @store.remove_last
  end

  def empty?
    if @store.empty?
      return true
    else
      return false
    end
  end

  def to_s
    return @store.to_s
  end
end

