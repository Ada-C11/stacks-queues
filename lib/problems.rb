require_relative "./stack.rb"

def balanced(string)
  return true if string == ""

  stack = Stack.new

  string.each_char do |bracket|
    case bracket
    when "(", "{", "["
      stack.push(bracket)
    when ")"
      if stack.pop != "("
        return false
      end
    when "}"
      if stack.pop != "{"
        return false
      end
    when "]"
      if stack.pop != "["
        return false
      end
    end
  end

  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
