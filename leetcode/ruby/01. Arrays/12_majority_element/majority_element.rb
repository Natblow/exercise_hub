# frozen_string_literal: true

# Instructions :
# Given an array nums of size n, return the majority element.
# The majority element is the element that appears more than ⌊n / 2⌋ times.
# You may assume that the majority element always exists in the array.


# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    nums.sort[nums.length / 2]
end

def majority_element(nums)
    acc = nums.tally
    acc.key(acc.values.max)
end

def majority_element(nums)
    hash = {}
    i = 1
    highest_count =  1
    majority = nums[0]
    hash[nums[0]] = 1
    while i < nums.size
        num = nums[i]
        if hash[num]
            hash[num] = hash[num] + 1
            if hash[num] > highest_count
                highest_count = hash[num]
                majority = num
            end
        else
            hash[num] = 1
        end

        i = i + 1
    end

    majority
end