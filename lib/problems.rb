require_relative './stack.rb'

def balanced(string)
  bracket_hash = 
  {
    ")" => "(",
    "]" => "[",
    "}" => "{"
  }

  bracket_stack = Stack.new

  string.each_char do |char|
    if bracket_hash.values.include?(char)
      bracket_stack.push(char)
    elsif bracket_hash.keys.include?(char)
      if bracket_stack.empty? || bracket_hash[char] != bracket_stack.pop()
        return false
      end
    end
  end
  return bracket_stack.empty?
end

def evaluate_postfix(postfix_expression)
  operators = ["+", "-", "*", "/"]
  stack = Stack.new

  postfix_expression.each_char do |char|
    if char =~ /\d/
      stack.push(char)
      puts "char #{char}"
    elsif operators.include?(char)
      second = stack.pop().to_i
      first = stack.pop().to_i
      result = first.public_send(char, second)
      puts char
      puts "result #{result}"
      stack.push(result)
    end
  end
  return stack.pop()
end