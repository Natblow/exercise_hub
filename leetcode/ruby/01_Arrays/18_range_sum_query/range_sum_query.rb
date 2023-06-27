# frozen_string_literal: true

# Instructions:
# Given an integer array nums, handle multiple
# queries of the following type:

# Calculate the sum of the elements of nums between
# indices left and right inclusive where left <= right.

# Implement the NumArray class:

# NumArray(int[] nums) Initializes the object with the
# integer array nums.
# int sumRange(int left, int right) Returns the sum of
# the elements of nums between indices left and right 
# inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).

class NumArray # solution 1, Dynamic Programming

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @sum_cache = []
        sum = 0
        nums.each_with_index do |num, i|
            sum += num
            @sum_cache[i] = sum
        end
    end
    
    
=begin
    :type left: Integer
    :type right: Integer
    :rtype: Integer
=end
    
    def sum_range(left, right)
        left == 0 ? @sum_cache[right] : @sum_cache[right] - @sum_cache[left-1]
    end
end
    
    # Your NumArray object will be instantiated and called as such:
    # obj = NumArray.new(nums)
    # param_1 = obj.sum_range(left, right)

class NumArray # solution 2, faster runtime and less memory usage than solution 1

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @sums = [0]
        sum = 0
        nums.each do |num|
        sum += num
        @sums << sum
        end
    end
    
    
=begin
    :type left: Integer
    :type right: Integer
    :rtype: Integer
=end
    def sum_range(left, right)
        @sums[right + 1] - @sums[left]
    end
end