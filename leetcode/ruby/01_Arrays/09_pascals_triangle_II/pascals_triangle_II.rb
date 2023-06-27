# frozen_string_literal: true

# Instructions:
# Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
# In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
# Example 1:
# Input: rowIndex = 3
# Output: [1,3,3,1]
# Example 2:
# Input: rowIndex = 0
# Output: [1]
# Example 3:
# Input: rowIndex = 1
# Output: [1,1]


# @param {Integer} row_index
# @return {Integer[]}
#### Solution 1 ####

def get_row(row_index)
    (0..row_index).map { |e| binomial(row_index, e)}
end

def binomial(n, k)
    return 1 if n-k <= 0
    return 1 if k <=0

    fact(n) / ( fact(k) * fact( n - k ) )
end

def fact(n)
    (1..n).reduce(:*)
end

#### Solution 2 ####

def get_row(r)
    return [1] if r==0
    ans = [1]
    temp = 1
    for i in 1...r do
        temp = temp * (r-i+1)/i
        ans << temp
    end
    ans << 1
    return ans
end