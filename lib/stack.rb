require_relative "./linked_list.rb"

class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    return @store.add_first(element)
  end

  def pop
    return @store.remove_first()
  end

  def empty?
    return @store.empty?
  end

  def to_s
    str_q = []
    while !@store.empty?
      value = @store.remove_first()
      str_q << value
    end
    return str_q.reverse.to_s
  end
end
