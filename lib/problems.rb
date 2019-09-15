require_relative './stack.rb'

def balanced(string)
  bracket_buds = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  stack = Stack.new
  list = string.split('')

  if list.length % 2 != 0
    return false
  end
  
  list.each do |char|
    if bracket_buds.include?(char)
      stack.push(char)
    elsif char != bracket_buds[stack.pop]
      return false
    end
  end  
    return true
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end