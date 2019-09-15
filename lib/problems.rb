require_relative './stack.rb'

def balanced(string)
  pairs = {")" => "(", "}" => "{", "]"=>"["}
  character_stack = Stack.new
  i = 0
  while i < string.length
    if pairs.has_value?(string[i]) == true
      character_stack.push(string[i])
    else
      if character_stack.pop != pairs[string[i]]
        return false
      end
    end
    i+=1
  end

  if character_stack.empty? == true
    return true
  else
    return false
  end

end

def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end