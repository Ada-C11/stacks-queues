require_relative "./stack.rb"

PAREN_PAIRS = {
  "{" => "}",
  "[" => "]",
  "(" => ")",
}

def balanced(string)
  stack = Stack.new

  return true if string == ""

  string.each_char do |char|
    if PAREN_PAIRS[char]
      stack.push(char)
    else
      opening_paren = stack.pop
      return false if char != PAREN_PAIRS[opening_paren]
    end
  end

  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
