# frozen_string_literal: true

# Instructions:
# Given two integer arrays nums1 and nums2,
# return an array of their intersection.
# Each element in the result must appear as many
# times as it shows in both arrays and you may
# return the result in any order.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    result = []

    if nums1.length < nums2.length
        nums1.each do |n|
          result << n and nums2.delete_at(nums2.index(n)) if nums2.include?(n)
        end
    else 
        nums2.each do |n|
          result << n and nums1.delete_at(nums1.index(n)) if nums1.include?(n)
        end
    end
    
    return result
end