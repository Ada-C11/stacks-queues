require_relative "./stack.rb"
require "pry"

def balanced(string)
  matches = {
    "(" => ")",
    "{" => "}",
    "[" => "]",
  }

  if string.length % 2 != 0
    return false
  elsif string.length == 0
    return true
  end

  stack = Stack.new

  string.each_char do |char|
    if matches.keys.include?(char)
      stack.push(char)
    else
      open_parens = stack.pop
      if matches[open_parens] != char
        return false
      end
    end
  end

  return true
end

def evaluate_postfix(postfix_expression)
  stack = Stack.new

  operators = ["+", "-", "*", "/"]

  postfix_expression.each_char do |char|
    if !operators.include?(char)
      stack.push(char)
    else
      value_two = stack.pop.to_i
      value_one = stack.pop.to_i
      operator = char
      result = value_one.send(operator, value_two)
      stack.push(result)
    end
  end

  return stack.pop
end
