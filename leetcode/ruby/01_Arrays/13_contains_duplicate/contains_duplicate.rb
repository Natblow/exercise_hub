# frozen_string_literal: true

# Instructions: 
# Given an array of integers, find if the array contains any duplicates.

def contains_duplicate(nums)
    return false if nums.length == 1
    
    h = {}
    nums.each do |num|
        return true if h[num]
        h[num] = 1
    end
    return false
end

def contains_duplicate(nums)
    nums.uniq.count != nums.count
end