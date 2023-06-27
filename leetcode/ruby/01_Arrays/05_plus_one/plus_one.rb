# frozen_string_literal: true

# You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
# Increment the large integer by one and return the resulting array of digits.

def plus_one(digits)
    large_int = digits.inject { |acc, el| acc*10 + el} + 1
    large_int.to_s.chars.map(&:to_i)
end

# even more simple solution:
def plus_one(digits)
    (digits.join.to_i + 1).to_s.chars.map(&:to_i)
end

# Pointer with modulus solution:
def plus_one(digits)
    carryover, pointer = 1, -1
    
    while carryover.positive?
        break digits.unshift(carryover) if digits[pointer].nil?
        
        sum = digits[pointer] + carryover
        carryover = sum / 10
        digits[pointer] = sum % 10
        pointer -= 1
    end
        
    digits
end
