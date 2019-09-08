require_relative "./stack.rb"

PAREN_PAIRS = {
  "{" => "}",
  "[" => "]",
  "(" => ")",
}

OPERATORS = {
  "+" => 1,
  "-" => 1,
  "/" => 1,
  "*" => 1,
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
  stack = Stack.new

  postfix_expression.each_char do |char|
    if OPERATORS[char]
      num2 = stack.pop
      num1 = stack.pop
      result = "#{num1.to_i.public_send char, num2.to_i}"
      stack.push(result)
    else
      stack.push(char)
    end
  end

  return stack.pop.to_i
end
