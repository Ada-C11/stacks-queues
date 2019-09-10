require_relative './stack.rb'

def balanced(string)
  return false if string.length % 2 != 0
  s_1 = Stack.new()
  pairs = {
    ")" => "(",
    "}" => "{",
    "]" => "["
  }
  string.each_char do |val|
    if pairs.values.include?(val)
      s_1.push(val)
    else 
      if pairs[val] == s_1.peak_last
        s_1.pop
      else
        return false
      end
    end
  end
  return true if s_1.empty? 
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end