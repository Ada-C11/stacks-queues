require_relative "./stack.rb"

PAREN_PAIRS = {
  "{" => "}",
  "[" => "]",
  "(" => ")",
}

OPERATORS = Set["+", "-", "/", "*"]

def balanced(string)
  stack = Stack.new

  return true if string == ""

  string.each_char do |char|
    if PAREN_PAIRS[char]
      stack.push(char)
    else
      return false if char != PAREN_PAIRS[stack.pop]
    end
  end

  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  stack = Stack.new

  postfix_expression.each_char do |char|
    if OPERATORS.include?(char)
      num2 = stack.pop
      num1 = stack.pop
      result = num1.public_send char, num2
      stack.push(result)
    else
      stack.push(char.to_i)
    end
  end

  return stack.pop
end
