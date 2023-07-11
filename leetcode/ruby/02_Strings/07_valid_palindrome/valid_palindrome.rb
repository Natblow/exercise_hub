# frozen_string_literal: true

# Instructions:
# A phrase is a palindrome if, after converting all uppercase
# letters into lowercase letters and removing all 
# non-alphanumeric characters, it reads the same forward 
# and backward. Alphanumeric characters include letters and numbers.

# Given a string s, return true if it is a palindrome,
# or false otherwise.

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s.gsub!(/[^a-zA-Z0-9]/, '') == "" ? true : s.downcase!
  s == s.reverse
end

# Two Pointers:
def is_palindrome(s)
    s = s.downcase.delete("^a-z0-9")
    left = 0
    right = s.length - 1

    while left < right
        if s[left] == " "
            left += 1
        elsif s[right] == " "
            right -= 1
        elsif s[left] == s[right]
            left += 1
            right -= 1
        else s[left] != s[right]
            return false
        end
    end
    return true
end

def is_palindrome(s)
    filtered_s = s.gsub(/[^a-bA-Z0-9]/i,'').downcase
    left, right = 0, filtered_s.size - 1

    while left < right
        return false if filtered_s[left] != filtered_s[right]
        left += 1
        right -= 1
    end

    true
end