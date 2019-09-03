require_relative 'linked_list'

class Stack
  def initialize
    @internal_list = LinkedList.new()
  end

  def push(element)
    @internal_list.add_first(element)
  end

  def pop
    return nil if @internal_list.empty?
    @internal_list.remove_first()
  end

  def empty?
    @internal_list.empty?
  end

  def to_s
    return @internal_list.to_s
  end
end
