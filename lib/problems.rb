require_relative './stack.rb'

def balanced(string)
  char_map = {"]"=>"[", "}"=>"{", ")"=>"("}
  stack = Stack.new
  string.each_char do |char|
    if !stack.empty? && char_map[char] == stack.peak
      stack.pop
    else 
      stack.push(char)
    end
  end
  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end