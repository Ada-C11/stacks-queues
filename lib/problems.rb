require_relative './stack.rb'

def balanced(string)
  return true if string.empty?
  
  braces = {
    "}" => "{",
    "]" => "[",
    ")" => "(",
  }
  stack = Stack.new

  string.each_char do |char|
    if braces.values.include?(char)
      stack.push(char)
    else
      if stack.pop != braces[char]
        return false
      end
    end
  end
  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end