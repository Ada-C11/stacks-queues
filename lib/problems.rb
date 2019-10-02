require_relative './stack.rb'

def balanced(string)
  stack = Stack.new
  string.each_char do |char|
    if char == "{" || char == "[" || char == "("
      stack.push(char)  
    end
    if (stack.get_last() == "{" && char == "}") ||
      (stack.get_last() == "[" && char == "]") ||
      (stack.get_last() == "(" && char == ")")
      stack.pop()
    end
  end
  if stack.length() == 0 
    return true
  else
    return false
  end
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end