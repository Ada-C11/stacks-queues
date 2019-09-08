require_relative "./stack.rb"

def balanced(string)
  return true if string.length == 0

  stack = Stack.new

  pairs = {
    "(" => ")",
    "{" => "}",
    "[" => "]",
  }

  string.each_char do |char|
    if pairs.include?(char) # it's an opening parens
      stack.push(char)
    else # it's a closing parens
      last_value = stack.pop
      if char != pairs[last_value]
        return false
      end
    end
  end

  if stack.empty?
    return true
  else
    return false
  end
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
