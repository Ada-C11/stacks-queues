require_relative 'linked_list.rb'

class Stack
  def initialize
    @internal_list = LinkedList.new()
  end

  def push(element)
    @internal_list.add_first(element)
  end

  def pop
    @internal_list.remove_first
  end

  def empty?
    @internal_list.empty?
  end

  def get_first
    return nil if @internal_list.empty?
    return @internal_list.head.data
  end

  def to_s
    return @internal_list.to_s
  end
end
