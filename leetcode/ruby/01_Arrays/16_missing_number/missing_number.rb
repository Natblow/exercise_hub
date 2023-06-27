# frozen_string_literal: true

# Instructions:
# Given an array nums containing n distinct numbers 
# in the range [0, n], return the only number in the
# range that is missing from the array.

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    s = nums.sort
    return 0 unless s[0] == 0

    s.each_index { |i| return s[i] + 1 unless s[i+1] == s[i] + 1 }
end

# Sum of 0..n minus sum of the given numbers is the missing one.
# O(1) extra space
def missing_number(nums)
    (0..nums.size).sum - nums.sum
end

# Xor-ing the given numbers and 0..n.
# O(n) extra space
def missing_number(nums)
    nums.zip(1.step).flatten.reduce(:^)
end

def missing_number(nums)
    nums.reduce(:^) ^ (0..nums.length).reduce(:^) 
end

def missing_number(nums)
    pointer = 0
    # Use cyclic sort to place all numbers in their correct indexes.
    # Because nums is only large enough for n-1 elements
    # and we want to find the missing number out of n elements, 
    # we should only sort the first n-1 elements
    while pointer < nums.length
        # if the current number is n, then set that to nil to get it out of the array
        if nums[pointer] == nums.length
            nums[pointer] = nil
        elsif nums[pointer] && nums[pointer] != pointer
        # swap each element with the element at its correct index (num[index] should equal index)
        # until the current index contains the correct element.
        # if the current element is nil, skip it because that means it could be the missing number
            tmp = nums[pointer]
            nums[pointer] = nums[tmp]
            nums[tmp] = tmp
        else
            pointer += 1
        end
    end

    # find missing element. Any index that contains nil is the missing element
    nums.each.with_index do |num, index|
        return index unless num
    end

    # if no indexes contain nil, then n is the missing element
    nums.length
end