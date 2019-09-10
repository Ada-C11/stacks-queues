class Queue

  def initialize
    @store = LinkedList.new()
  end

  def enqueue(element)
    if @store.empty?
      @store.add_first(element)
    else
      @store.add_last(element)
    end
  end

  def dequeue
   if @store.empty?
    return nil
   else
    value = @store.remove_first
   end

   return value
  end

  def front
    @store.get_first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
