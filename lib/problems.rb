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
  numbers = {
    "0" => true, 
    "1" => true,
    "2" => true,
    "3" => true, 
    "4" => true, 
    "5" => true, 
    "6" => true, 
    "7" => true, 
    "8" => true, 
    "9" => true,
  }

  stack = Stack.new

  postfix_expression.each_char do |val|
    if numbers.include?(val)
      stack.push(val.to_i)
    else
      operand_one = stack.pop
      operand_two = stack.pop

      if val == "+"
        result = operand_one + operand_two
      elsif val == "*"
        result = operand_one * operand_two
      elsif val == "-"
        result = operand_two - operand_one
      else
        result = operand_two / operand_one
      end
      
      stack.push(result)
    end 
  end

  final_result = stack.pop
  return final_result
end
