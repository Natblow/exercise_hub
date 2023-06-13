# frozen_string_literal: true

# Instructions:
# Given two integer arrays nums1 and nums2, 
# return an array of their intersection. 
# Each element in the result must be unique and 
# you may return the result in any order.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
    a = []
    for i in nums2
        if nums1.include?(i)
            a << i 
        end 
    end
    p a.uniq
end

def intersection(nums1, nums2)
    nums1 & nums2
end

def intersection(nums1, nums2)
    nums1.intersection.nums2
end

require 'set'
def intersection(nums1, nums2)
    result  = []
    nums1   = nums1.to_set()
    nums2   = nums2.to_set()
    
    if nums2.length < nums1.length
        nums2.each do |n|
            result << n if nums1.include?(n)
        end
    else
        nums1.each do |n|
            result << n if nums2.include?(n)
        end
    end

    return result
end 