require_relative "./stack.rb"
require_relative "./queue.rb"
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
  raise NotImplementedError, "Not implemented yet"
end
