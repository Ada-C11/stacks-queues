class Stack
  attr_accessor :store, :size

  def initialize(length)
    @store = Array.new(length)
    @size = 0
  end

  def push(element)
    if @size > @store.length - 1
      return "Stack Overflow"
    else
      @store[@size] = element
      @size += 1
    end
      return @store.compact
  end

  def pop
    if self.empty?
      return "empty"
    end
    removed = @store[@size - 1]
    @store = @store[0...-1]
    @size -= 1
    return removed
  end

  def empty?
    return @size == 0 ? true : false
  end

  def to_s
    return @store.compact.to_s
  end

  def peek
    return @store[@size - 1]
  end
end
