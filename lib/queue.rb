require_relative "./linked_list.rb"

# Using a circular buffer implement a Queue with the following methods:

# enqueue(value) - Adds the value to the back of the queue.
# dequeue - removes and returns a value from the front of the queue
# empty? returns true if the queue is empty and false otherwise

class Queue
  Q_SIZE = 5

  def initialize
    @store = Array.new(Q_SIZE)
    @head = -1
    @tail = -1
  end

  def enqueue(element)
    # q is full if rear = length - 1 or head - 1
    if (@tail + 1 == @head) || (@tail + 1 == Q_SIZE)
      raise ArugmentError, "queue is full"
      # if head and tail are -1, then make it head
      # move head and tail to 1
    elsif @head == -1 && @tail == -1
      @store[0] = element
      @head = 0
      @tail = 0
      # head starts at not 0, and tail is last element
    elsif @head > 0 && (@tail + 1 == Q_SIZE)
      @tail = 0
      @store[@tail] = element
    else
      @tail += 1
      @store[@tail] = element
    end
  end

  def dequeue
    raise ArugmentError, "q empty" unless !empty?
    # if head is at end of array
    data = @store[@head]
    @store[@head] = nil
    if @head == Q_SIZE - 1
      # data = @store[@head]
      # @store[@head] = nil
      @head = 0
      # if only one element
    elsif @head == @tail
      # data = @store[@head]
      # @store[@head] = nil
      @head = @tail = -1
    else
      # data = @store[@head]
      # @store[@head] = nil
      @head += 1
    end
    return data
  end

  def front
    return @head == -1 ? nil : store[@head]
  end

  def size
    if empty?
      return 0
    elsif @head == 0
      return @tail + 1
    elsif @tail < @head
      return (Q_SIZE - head + @tail + 1)
    end
  end

  def empty?
    return @head == -1 && @tail == -1
  end

  def to_s
    clone_store = @store.clone
    clone_store.delete(nil)
    return clone_store.to_s
  end
end
