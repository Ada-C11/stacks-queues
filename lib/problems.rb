require_relative "./stack.rb"

def balanced(string)
  return true if string == ""

  # set up
  stack = Stack.new
  char_map = {
    "}" => "{",
    "]" => "[",
    ")" => "(",
  }
  open_chars = ["{", "[", "("]

  # loop through each char
  # push to stack if it's opening char. if not, look up corresponding value in hash
  # compare hash value to popped stack node. if they are not equal or hash value is nil, return false
  # finally, check if the stack is empty. if it is, it means everything matches up

  string.each_char do |c|
    if open_chars.include?(c)
      stack.push(c)
    else
      pop_c = stack.pop
      return false unless pop_c && pop_c == char_map[c]
    end
  end
  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  num_stack = Stack.new
  postfix_expression.each_char do |c|
    case c
    # when it's an operand, pop both operands out, perform operation, push back to stack
    when "+"
      num2 = num_stack.pop
      num1 = num_stack.pop
      num_stack.push(num1 + num2)
    when "-"
      num2 = num_stack.pop
      num1 = num_stack.pop
      num_stack.push(num1 - num2)
    when "*"
      num2 = num_stack.pop
      num1 = num_stack.pop
      num_stack.push(num1 * num2)
    when "/"
      num2 = num_stack.pop
      num1 = num_stack.pop
      num_stack.push(num1 / num2)
    else
      # push to stack
      num_stack.push(c.to_i)
    end
  end
  return num_stack.pop
end
