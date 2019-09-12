require_relative "./stack.rb"

def balanced(string)
  return true if string == ""
  stack = Stack.new
  char_map = {
    "}" => "{",
    "]" => "[",
    ")" => "(",
  }
  open_chars = ["{", "[", "("]
  string.each_char do |c|
    if open_chars.include?(c)
      stack.push(c)
    else
      pop_c = stack.pop
      return false unless pop_c && pop_c == char_map[c]
    end
  end
  return stack.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
