require_relative "./stack.rb"

def balanced(string)
  stack = Stack.new
  pairs = { ")" => "(", "]" => "[", "}" => "{" }
  string.each_char do |bracket|
    if pairs.values.include?(bracket)
      stack.push(bracket)
    else
      return false if stack.empty? or pairs[bracket] != stack.pop()
    end
  end
  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
