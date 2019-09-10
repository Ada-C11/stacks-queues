require "linked_list"

class Stack
  def initialize
    @list = LinkedList.new
  end

  def push(element)
    @list.add_last(element)
  end

  def pop
    return nil if self.empty?

    element = @list.remove_last

    return element
  end

  def empty?
    return @list.empty?
  end

  def to_s
    return @list.to_s
  end
end
