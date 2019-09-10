class Queue

  def initialize
    @store = []
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue
    removed = @store[0]
    @store = @store[1..-1]
    return removed
  end

  def front
    return @store[0]
  end

  def size
    return @store.length
  end

  def empty?
    if @store.length > 0
      return false
    else
      return true
    end
  end

  def to_s
    return @store.to_s
  end
end
