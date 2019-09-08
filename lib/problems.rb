require_relative './stack.rb'

def balanced(string)
  left_stack = Stack.new

  return false if string.length % 2 != 0 

  i = 0
  while i < string.length
    if string[i] == '{' || string[i] == '(' || string[i] == '['
      left_stack.push(string[i])
    else
      if left_stack.empty?
        return false
      end
      if string[i] == ')' && left_stack.pop != '(' || string[i] == ']' && left_stack.pop != '[' || string[i] == '}' && left_stack.pop != '{'
        return false
      end
    end
    i += 1
  end

  return true
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end