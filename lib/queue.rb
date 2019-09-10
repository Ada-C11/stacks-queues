class Queue
  attr_writer :buffer_size, :ari

  def initialize(buffer_size)
    @ari_size = buffer_size + 1
    @ari = Array.new(@ari_size)
    @front = 0
    @back = 0
  end

  def enqueue(element)
    if @back == @front - 1
      print "full"
    else
      @ari[@back] = element
      @back += 1
    end
  end

  def dequeue
    if self.empty?
      print "empty"
    end
    removed = @ari[@front]
    @front += 1
    return removed
  end

  def front

  end

  def size
    return @back - @front
  end

  def empty?
    return @front == @back
  end

  def to_s
    return @ari[@front...@back].to_s
  end
end
