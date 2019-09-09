require_relative "./stack.rb"

def balanced(string)
  stack = Stack.new()
  string.each_char do |c|
    if c == "(" || c == "[" || c == "{"
      stack.push(c)
    else
      prev = stack.pop
      if c == "}"
        return false if prev != "{"
      elsif c == ")"
        return false if prev != "("
      elsif c == "]"
        return false if prev != "["
      end
    end
  end
  result = stack.empty?
  return result
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
