# frozen_string_literal: true

# Instructions:
# Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
# You must write an algorithm with O(log n) runtime complexity.

# Binary search, correct solution as it is O(log n) runtime complexity
def search_insert(nums, target)
    min = 0
    max = nums.length
  
    mid = (max + min)/ 2
  
    while true 
      return mid if nums[mid] == target
      
      # Signals the last search
      if mid == max or mid == min
  
        # target would go after this index if target is bigger
        mid += 1  if nums[mid] < target
        return mid
      end
  
      # set mid as current max if guess is bigger
      if nums[mid] > target
        max = mid
    
      # set mid as current min if guess is lower
      else nums[mid] < target
        min = mid
        
      end
      
      # take new mid
      mid = (max + min)/ 2
    end
  end

# For loop solution, not O(log n) runtime complexity
def search_insert(nums, target)
    for index in 0...nums.size
        if nums[index] >= target
            return index
        end
    end    
    return nums.size
end

#Simple solution but not O(log n) runtime complexity
def search_insert(nums, target)
    nums.select{|k| k < target }.length
end

