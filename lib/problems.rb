require_relative './stack.rb'
require "pry"

def balanced(string)
  return false if string.length.odd?
  return true if string.empty?

  bracket_hash = {
    '{' => '}',
    '(' => ')',
    '[' => ']'
  }

  first_half = Stack.new()
  second_half = Stack.new()

  midpoint = (string.length)/2
  i = 0
  j = string.length - 1

  while i < midpoint
    first_half.push(string[i])
    i += 1
  end

  while j >= midpoint
    second_half.push(string[j])
    j -= 1
  end
  while !first_half.empty? && !second_half.empty?
    open = first_half.pop
    close = second_half.pop
    if bracket_hash.key(close) != open
      return false
    end
  end

  return true


end

def evaluate_postfix(postfix_expression)
  operands = ["+", "-", "/", "*"]

  math_stack = Stack.new()

  postfix_expression.each_char do |element|
      if !operands.include?(element)
        math_stack.push(element)
      else
        num1 = math_stack.pop.to_i
        num2 = math_stack.pop.to_i
        operator = element
        solution = num2.send(operator, num1)
        math_stack.push(solution)
      end
  end

  return math_stack.pop
end