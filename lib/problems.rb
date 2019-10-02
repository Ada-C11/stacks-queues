require_relative './stack.rb'

def balanced(string)
  pairs = { ")" => "(", "]" => "[", "}" => "{" }
  stack = Stack.new

  string.each_char do |char|
    if pairs.values.include?(char)
      stack.push(char)
    else
      return false if stack.empty? or pairs[char] != stack.pop()
    end
  end
  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  stack = Stack.new
  postfix_expression.split("").each do |char|
    if char == char.to_i.to_s
      stack.push(char.to_i)
    else
      num1 = stack.pop()
      num2 = stack.pop()
      case(char)
      when "+"
        stack.push(num2 + num1)
      when "-"
        stack.push(num2 - num1)
      when "/"
        stack.push(num2 / num1)
      when "*"
        stack.push(num2 * num1)
      end
    end
  end
  return stack.pop()
end
