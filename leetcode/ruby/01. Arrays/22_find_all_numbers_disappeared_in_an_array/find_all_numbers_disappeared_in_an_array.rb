# frozen_string_literal: true

# Instructions:
# Given an array nums of n integers where nums[i]
# is in the range [1, n],
# return an array of all the integers in the range
# [1, n] that do not appear in nums.


# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
    p = 0
    
    # use cyclic sort to sort the array in linear time and constant space
    while p < nums.length
      # num is not in its correct index (each num n should be at index n-1)
      if nums[p] != nums[nums[p]-1]
        # swap num with the num at its correct index
        tmp = nums[p]
        nums[p] = nums[tmp-1]
        nums[tmp-1] = tmp
      else
        p += 1
      end
    end
    
    # in newly sorted array, any index that does not contain the correct
    # number means that number is missing.
    # again, each index n should contain the number n+1
    disappeared_nums = []
    nums.each.with_index do |num, i|
      disappeared_nums.append(i+1) unless num == i+1
    end
    
    disappeared_nums
end

#############
