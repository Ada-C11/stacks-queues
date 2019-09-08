require 'linked_list.rb'

class Stack
  def initialize
    @store = LinkedList.new()
  end

  def push(element)
    if @store.empty? 
      @store.add_first(element)
    else
      @store.add_last(element)
    end
  end

  def pop
    if @store.empty?
      return nil 
    else
      value_returned = @store.remove_last
    end
    return value_returned
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
