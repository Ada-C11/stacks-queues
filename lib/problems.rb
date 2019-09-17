require_relative './stack.rb'

def balanced(string)

  brackets = {
    '{'=> '}',
    '('=> ')',
    '['=> ']'
    };

  return true if string.length == 0
  return false if string.length % 2 != 0

  stack = Stack.new

  string.each_char do |char|
    if brackets[char]
      stack.push(char)
    else
      return false if char != brackets[stack.pop]
    end
  end

  return stack.empty?

end


# def balanced(string)?

  # return !stack.empty?

  # stack_left = Stack.new
  # stack_right = Stack.new
  # sub_string_length = string.length / 2
  # left_counter = 0
  # right_counter = string.length - 1
  #
  # until left_counter == sub_string_length
  #   stack_left.push(string[left_counter])
  #   left_counter += 1
  # end
  #
  # until right_counter == sub_string_length - 1
  #   stack_right.push(string[right_counter])
  #   right_counter -= 1
  # end
  #
  # until stack_left.empty? || stack_right.empty?
  #   left_value = stack_left.pop
  #   right_value = stack_right.pop
  #   return false if left_value != right_value
  # end
  #
  # return true if stack_left.empty? && stack_right.empty?

# end

# def is_even_length?(string)
#   return (string.length % 2 == 0) ? true : false
# end



# OPTIONAL WAVE 4
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
