# frozen_string_literal: true

# Instructions:
# Given a string containing just the characters 
# '(', ')', '{', '}', '[' and ']',
# determine if the input string is valid.
# An input string is valid if:
# - Open brackets must be closed by the same type of brackets.
# - Open brackets must be closed in the correct order.
# Every close bracket has a corresponding open bracket 
# of the same type.

# @param {String} s
# @return {Boolean}
def is_valid(s)
    return true if s.empty?
    
    stack = []
    s.each_char do |c|
        case c
        when '(', '{', '['
            stack.push(c)
        when ')'
            return false if stack.pop() != '('
        when '}'
            return false if stack.pop() != '{'
        when ']'
            return false if stack.pop() != '['
        end
    end
    return stack.empty?
end