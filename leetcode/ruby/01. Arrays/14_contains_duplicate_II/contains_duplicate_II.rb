# frozen_string_literal: true

# Instructions:
# Given an integer array nums and an integer k,
# return true if there are two distinct indices 
# i and j in the array such that nums[i] == nums[j]
# and abs(i - j) <= k. 

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
    h = {}
    nums.each_with_index do |num, i|
        return true if h[num] && (h[num] - i).abs <= k
        h[num] = i
    end
    false
end