require_relative "./stack.rb"

# PAREN = { "(": ")",
#          "{": "}",
#          "[": "]" }

PAREN = { ")": "(",
          "}": "{",
          "]": "[" }

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
  raise NotImplementedError, "Not implemented yet"
end
