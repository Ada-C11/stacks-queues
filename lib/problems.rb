require_relative "./stack.rb"

PAREN = { ")": "(",
          "}": "{",
          "]": "[" }

OPERATORS = ["+", "-", "*", "/"]

def balanced(string)
  return true if string == ""
  return false if string.length % 2 != 0

  stack = Stack.new
  balanced = true

  i = 0
  while i <= string.length - 1
    target = string[i]
    balanced = true

    if PAREN.value?(target)
      stack.push(target)
    else
      popped = stack.pop
      balanced = PAREN[target.to_sym] == popped
    end

    return false if !balanced
    i += 1
  end

  return balanced
end

def evaluate_postfix(postfix_expression)
  stack = Stack.new

  i = 0
  while i <= postfix_expression.length - 1
    target = postfix_expression[i]

    if !OPERATORS.include?(target)
      stack.push(target.to_i)
    else
      operator = target
      operand_second = stack.pop
      operand_first = stack.pop

      result = (operand_first).public_send(operator, operand_second)
      stack.push(result)
    end

    i += 1
  end

  return stack.pop
end
