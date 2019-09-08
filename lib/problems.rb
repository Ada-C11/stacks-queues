require_relative "./stack.rb"

def balanced(string)
  return true if string == ""

  parens_hash = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }

  stack_parens = Stack.new
  string.each_char do |paren|
    if parens_hash[paren]
      stack_parens.push(parens_hash[paren])
    else
      return false if paren != stack_parens.pop
    end
    puts stack_parens.to_s
  end

  return stack_parens.empty?
end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
