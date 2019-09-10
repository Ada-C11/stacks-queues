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
  end

  return stack_parens.empty?
end

def evaluate_postfix(postfix_expression)
  operand_hash = {
    "+" => true,
    "-" => true,
    "*" => true,
    "/" => true,
  }

  stack_postfix = Stack.new
  postfix_expression.each_char do |char|
    if !operand_hash[char]
      stack_postfix.push(char)
    else
      digit2 = stack_postfix.pop.to_i
      digit1 = stack_postfix.pop.to_i

      case char
      when "+"
        value = digit1 + digit2
      when "-"
        value = digit1 - digit2
      when "*"
        value = digit1 * digit2
      when "/"
        value = digit1 / digit2
      end
      stack_postfix.push(value)
    end
  end
  return stack_postfix.pop
end
