class Stack
  STACK_SIZE = 20

  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def push(element)
    if @front == -1
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear
      raise ArgumentError, "Stack is full"
    else
      new_rear = (@rear + 1) % STACK_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def pop
    if @front == -1 
      raise ArgumentError, "Stack is empty"
    else
      popped = @store[@rear - 1]
      @store[@rear - 1] = nil
      @rear = (@rear - 1) % STACK_SIZE
      return popped
    end
  end

  def empty?
    stack = @store.compact
    if stack.length == 0
      return true
    else
      return false
    end
  end

  def to_s
    return @store.compact.to_s
  end
end
