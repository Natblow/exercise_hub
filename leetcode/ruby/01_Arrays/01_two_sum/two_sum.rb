# frozen_string_literal: true

# Instructions:
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.

def two_sum(nums, target)
    h = {} # stores what we've seen in the iteration, :key is the number, :value is the index
    nums.each_with_index do |num, i|
        return [h[target-num],i] if h[target-num]
        h[num] = i
    end
end