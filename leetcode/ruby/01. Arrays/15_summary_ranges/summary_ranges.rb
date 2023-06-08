# frozen_string_literal: true

# Instructions:
# You are given a sorted unique integer array nums
# A range [a,b] is the set of all integers from a to b (inclusive).
# Return the smallest sorted list of ranges that cover all the 
# numbers in the array exactly. That is, each element of nums is 
# covered by exactly one of the ranges, and there is no integer x
# such that x is in one of the ranges but not in nums.

# Each range [a,b] in the list should be output as:
# "a->b" if a != b
# "a" if a == b

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
    index = 0
    result = []
    
    nums.each_index do |i|
        next if nums[i + 1] == nums[i] + 1
        
        result << (index == i ? nums[i].to_s : "#{nums[index]}->#{nums[i]}")
        index = i + 1
    end
        
    result
end

def summary_ranges(nums)
    nums.each_with_index.group_by{|n,i| n-i}.map{|d,r| [r[0][0], r[-1][0]].uniq.join('->')}
end

def summary_ranges(nums)
    nums.chunk_while{ |a, b| a + 1 == b }.map{ |x| [x.first, x.last].uniq.join("->") }
end