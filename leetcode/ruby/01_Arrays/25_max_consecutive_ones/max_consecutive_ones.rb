# frozen_string_literal: true

# Instructions: 
# Given a binary array nums, return the maximum
# number of consecutive 1's in the array.

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
    max = 0
    count = 0
    nums.each do |num|
        if num == 1
        count += 1
        max = count if count > max
        else
        count = 0
        end
    end
    max
end

def find_max_consecutive_ones(a) = a.join.split(/0+/).map(&:size).max || 0

def find_max_consecutive_ones(nums)
    a = []
    count = 0
    length = nums.length - 1
    nums.each_with_index do |n, i|
        unless n == 1
            a << count
            count = 0
        end
        count += 1 if n == 1
        a << count if i == length
    end
    a.max
end

