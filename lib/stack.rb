require_relative "./linked_list.rb"

class Stack
  def initialize
    @store = LinkedList.new
    @length = 0
  end

  def push(element)
    @length += 1
    return @store.add_first(element)
  end

  def pop
    @length -= 1
    return @store.remove_first()
  end

  def empty?
    return @length == 0
  end

  def peak
    return @store.get_first()
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
