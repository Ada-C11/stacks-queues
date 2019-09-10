require_relative "./stack.rb"

def balanced(string)
  length = string.length
  mid = length / 2
  start = 0
  finish = -1

  if length % 2 != 0
    return false
  end

  while start < mid
    if (string[start] == "{" && string[finish] == "}") ||
       (string[start] == "(" && string[finish] == ")") ||
       (string[start] == "[" && string[finish] == "]")
      start += 1
      finish -= 1
    else
      return false
    end
  end
  return true
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
