class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element)
  end

  def pop
    @store.pop
  end

  def empty?
    return length = 0
  end

  def to_s
    return @store.to_s
  end
end
