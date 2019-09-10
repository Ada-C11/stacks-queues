require_relative './stack.rb'
require 'pry'

def balanced(string)
  if string == ''
    return true
  end
  if string.length % 2 != 0
    return false
  end

  s = Stack.new(string.length)
  validator = {
      "(" => ")",
      "[" => "]",
      "{" => "}"
  }

  i = 0
  while i < string.length
    char = string[i]
    if validator.key?(char)
      s.push(char)
    else
     if validator[s.peek] == char
       s.pop
     else
       false
     end
    end
    i += 1
  end

  if !(s.empty?)
    return false
  else
    return true
  end
end



def evaluate_postfix(postfix_expression)
  i = 0
  num_stack = Stack.new(postfix_expression.length)

  while i < postfix_expression.length
    char = postfix_expression[i]
    if char == "*" || char == "+" || char == "-" || char == "/"
      s_num = num_stack.pop
      f_num = num_stack.pop
      new_num = arithmetic(f_num, s_num, char)
      num_stack.push(new_num)
    else
      num_stack.push(char.to_i)
    end
    i += 1
  end

  if num_stack.size == 1
    return num_stack.peek
  end
end

def arithmetic(first_num, second_num, exp)
  case exp
  when "*"
    return (first_num.to_i * second_num.to_i)
  when "+"
    return (first_num.to_i + second_num.to_i)
  when "-"
    return (first_num.to_i - second_num.to_i)
  when "/"
    return (first_num.to_i / second_num.to_i)
  end
end