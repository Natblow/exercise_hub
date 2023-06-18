# frozen_string_literal: true

# Instructions:
# Given an integer array nums, return the 
# third distinct maximum number in this array.
# If the third maximum does not exist, return
# the maximum number.

# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
    nums.uniq.length < 3 ? nums.max : nums.uniq.max(3)[-1]
end

#3 pointers
def third_max(nums)
    first_max = [-1, false]
    second_max = [-1, false]
    third_max = [-1, false]
  
    nums.each do |num|
      # If current number is already stored, skip it.
      next if (first_max[1] && first_max[0] == num) ||
              (second_max[1] && second_max[0] == num) ||
              (third_max[1] && third_max[0] == num)
  
      # If we never stored any variable in first_max
      # or curr num is bigger than first_max, then curr num is the biggest number.
      if !first_max[1] || first_max[0] <= num
        third_max = second_max
        second_max = first_max
        first_max = [num, true]
      # If we never stored any variable in second_max
      # or curr num is bigger than second_max, then curr num is the 2nd biggest number.
      elsif !second_max[1] || second_max[0] <= num
        third_max = second_max
        second_max = [num, true]
      # If we never stored any variable in third_max
      # or curr num is bigger than third_max, then curr num is the 3rd biggest number.
      elsif !third_max[1] || third_max[0] <= num
        third_max = [num, true]
      end
    end
  
    # If third max was never updated, it means we don't have 3 distinct numbers.
    return first_max[0] unless third_max[1]
  
    third_max[0]
end