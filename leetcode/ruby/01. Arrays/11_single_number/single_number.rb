# frozen_string_literal: true

# Instructions:
# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
# Follow up: Could you implement a solution with a linear runtime complexity and without using extra memory?

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    nums.reduce(:^)
end

# fastest solution 98ms runtime and 212.4mb memory
def single_number(nums)
    out = 0
    nums.each do |num|
        out ^= num
    end
    out
end