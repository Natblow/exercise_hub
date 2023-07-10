# frozen_string_literal: true

# Instructions:
# Given two binary strings a and b,
# return their sum as a binary string.

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    return add_binary(b, a) if b.size > a.size 

    carry = '0'
    1.upto(a.size) do |i|
        sum = a[-i] + (b[-i] || '0') + carry

        case sum
        when '100', '010', '001'
            a[-i] = '1'
            carry = '0'
        when '110', '011', '101'
            a[-i] = '0'
            carry = '1'
        when '111'
            a[-i] = '1'
            carry = '1'
        end
    end

    carry == '1' ? '1' + a : a
end

def add_binary(a, b)
    x = a.to_i(2)
    y = b.to_i(2)
    
    while y != 0
        answer = x ^ y
        carry = (x & y) << 1
        x = answer
        y = carry
    end
    
    return x.to_s(2)
end