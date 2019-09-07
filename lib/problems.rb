require_relative "./stack.rb"

def balanced(string)
  complements = {
    "}" => "{",
    "]" => "[",
    ")" => "(",
  }
  return true if string.length == 0

  stack = Stack.new

  string.each_char do |c|
    if complements.values.include?(c)
      stack.push(c)
    else
      if stack.pop != complements[c]
        return false
      end
    end
  end
  return false if !stack.empty?
  return true
end

def evaluate_postfix(postfix_expression)
  operators = ["+", "-", "/", "*"]

  stack = Stack.new

  postfix_expression.each_char do |c|
    result = ""
    if !operators.include?(c)
      stack.push(c.to_i)
    else
      case c
      when "+"
        result = stack.pop + stack.pop
      when "-"
        result = -(stack.pop - stack.pop)
      when "*"
        result = stack.pop * stack.pop
      when "/"
        a = stack.pop
        b = stack.pop
        result = b / a
      end
      stack.push(result)
    end
  end
  return stack.pop
end
