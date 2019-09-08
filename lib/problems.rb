require_relative "./stack.rb"

def balanced(string)
  stack1 = Stack.new
  string.each_char do |char|
    if char == "{" || char == "[" or char == "("
      stack1.push(char)
    end
    if !stack1.empty?
      if char == "}"
        if stack1.peek == "{"
          stack1.pop
        else
          return false
        end
      end
      if char == "]"
        if stack1.peek == "["
          stack1.pop
        else
          return false
        end
      end
      if char == ")"
        if stack1.peek == "("
          stack1.pop
        else
          return false
        end
      end
    end
  end
  if stack1.empty?
    return true
  end
  return false
end

OPERANDS = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }

def evaluate_postfix(postfix_expression)
  # From the postfix expression, when some operands are
  # found, push them in the stack. When some operator is
  # found, two items are popped from the stack and the
  # operation is performed in correct sequence. After that,
  # the result is also pushed in the stack for future use.
  # After completing the whole expression, the final result
  # is also stored in the stack top.

  # Example: Input and Output

  # Input: Postfix expression: 53+62/35+

  # Output: The result is: 39
  stack = Stack.new
  postfix_expression.each_char do |char|
    if OPERANDS.include?(char)
      stack.push(char)
    end
    if char == "+"
      val1, val2 = pop_two_values(stack)
      stack.push(val2 + val1)
    end
    if char == "-"
      val1, val2 = pop_two_values(stack)
      stack.push(val2 - val1)
    end
    if char == "*"
      val1, val2 = pop_two_values(stack)
      stack.push(val2 * val1)
    end
    if char == "/"
      val1, val2 = pop_two_values(stack)
      stack.push(val2 / val1)
    end
  end
  return stack.pop
end

def pop_two_values(stack)
  val1 = stack.pop.to_i
  val2 = stack.pop.to_i
  return val1, val2
end
