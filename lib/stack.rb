require_relative './linked_list' 

class Stack
  def initialize
    @store = LinkedList.new()
  end

  def push(element) # add to end
    @store.add_last(element)
  end

  def pop # remove from end
    @store.remove_last if !self.empty?
  end

  def empty?
    @store.empty?
  end

  def peak_last 
    return @store.get_last
  end

  def to_s
    return @store.to_s
  end
end
