require_relative "./stack.rb"

def balanced(string)
  return true if string == ""

  # set up
  stack = Stack.new
  char_map = {
    "}" => "{",
    "]" => "[",
    ")" => "(",
  }
  open_chars = ["{", "[", "("]

  # loop through each char
  # push to stack if it's opening char. if not, look up corresponding value in hash
  # compare hash value to popped stack node. if they are not equal or hash value is nil, return false
  # finally, check if the stack is empty. if it is, it means everything matches up

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
