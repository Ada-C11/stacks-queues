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

  first_half_string = Stack.new
  midpoint = (string.length - 1) / 2
  string[0..midpoint].each_char do |char|
    first_half_string.push(char)
  end

  second_half_string = string[(midpoint + 1)..-1]
  second_half_string.each_char do |char|
    open_parens = first_half_string.pop
    if matches[open_parens] != char
      return false
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
