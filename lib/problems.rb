require_relative "./stack.rb"

def balanced(string)
  parens_hash = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }
  stack = Stack.new
  array = string.split("")
  return false if array.length % 2 == 1
  
  array.each do |char|
    if parens_hash.include?(char)
      stack.push(char)
    else
      return false if char != parens_hash[stack.pop]
    end
  end
  return true
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
