require_relative './stack.rb'


def balanced(string)
  pairs = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }
  stack = Stack.new
  string.split("").each do |char|
    if !pairs[char]
      stack.push(char)
    else
      return false if pairs[char] != stack.pop()
    end
  end
  stack.empty? ? (return true) : (return false)
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end