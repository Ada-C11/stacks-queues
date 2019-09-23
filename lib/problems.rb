require_relative './stack.rb'

def balanced(string)
  string_stack = Stack.new()
  length = 0

  string.each_char do |char|
    string_stack.push(Node.new(char))
    length += 1
  end

  return false if length % 2 != 0

  length /= 2
  comparison_string_stack = Stack.new()

  length.times do
    comparison_string_stack.push(string_stack.pop)
  end

  key = {"[" => "]", "]" => "[", "{" => "}", "}" => "{", "(" => ")", ")" => "("}

  until string_stack.empty?
    letter1 = string_stack.pop
    letter2 = comparison_string_stack.pop
    return false if letter1.data != key[letter2.data]
  end
  return true
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end