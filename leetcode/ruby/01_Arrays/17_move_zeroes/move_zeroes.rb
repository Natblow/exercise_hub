# frozen_string_literal: true

# Instructions:
# Given an integer array nums, move all 0's to
# the end of it while maintaining the relative
# order of the non-zero elements.


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    k = 0
    nums.length.times do |i|
        next if nums[i].zero?

        nums[k] = nums[i]
        k += 1
    end
    
    k.upto(nums.length-1).each { |i| nums[i] = 0 }
end

def move_zeroes(nums) # slightly faster runtime than 1st solution but same memory usage
    length = nums.length
    nums.delete(0)
    (length - nums.length).times { nums.push(0) }
end

def move_zeroes(nums) #too slow
    j = 0
    nums.each_with_index do |x, i|
      unless x.zero?
          nums[i], nums[j] = nums[j], nums[i]
          j += 1
      end
    end
end

def move_zeroes(nums) #too slow
    nums.sort_by! { |x| x.zero? ? 1 : 0 }
end