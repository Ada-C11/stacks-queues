require_relative './stack.rb'

def balanced(string)
  if string == ""
    return true
  end

  parens = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }

  stack = Stack.new
  string.each_char do |element|
    if parens[element]
      stack.push(parens[element])
    else
      return false if element != stack.pop
    end
  end

  return stack.empty?

  # cannot do this either
  # if stack.empty?
  #   return
  # end

  #undefined method `length'
  # if stack.length == 0
  #   return true
  # end

end

  # open_paren = []
  # close_parens = []
  # PUSH PARENS INTO ARRAYS
  # string.each_char do |element|
  #   if element == "(" || element == "{" || element == "["
  #     open.push(element);
  #   else
  #     close.push(element);
  #   end
  # end
  # if open.length != close.length
  #   return false
  # end
  # is_balanced = false
  # for index in (0...open.length)
  #   if open[index] == "("  && close[(close.length - 1) - index] == ")" ||
  #   open[index] == "{"  && close[(close.length - 1) - index] == "}" ||
  #   open[index] == "["  && close[(close.length - 1) - index] == "]"
  #     is_balanced = true
  #   else
  #     return is_balanced
  #   end
  # end
  # return is_balanced


def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end