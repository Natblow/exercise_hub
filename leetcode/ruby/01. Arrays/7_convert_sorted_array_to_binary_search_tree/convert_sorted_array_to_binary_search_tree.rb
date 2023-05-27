# frozen_string_literal: true

# Instructions:
# Given an integer array nums where the elements are sorted in ascending order,
# convert it to a height-balanced binary search tree.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @TreeNode.new(mid, min, max)

def sorted_array_to_bst(nums)
    return if nums.empty?
    return TreeNode.new(nums[0]) if nums.length == 1

    mid_index = nums.length / 2

    node = TreeNode.new(nums[mid_index],
                    sorted_array_to_bst(nums[0..(mid_index - 1)]),
                    sorted_array_to_bst(nums[(mid_index + 1)..-1]))
    return node
end