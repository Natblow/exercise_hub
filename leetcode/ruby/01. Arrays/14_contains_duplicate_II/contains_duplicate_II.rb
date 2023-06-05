# frozen_string_literal: true

# Instructions:
# Given an integer array nums and an integer k,
# return true if there are two distinct indices 
# i and j in the array such that nums[i] == nums[j]
# and abs(i - j) <= k. 

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
    h = {}
    nums.each_with_index do |num, i|
        return true if h[num] && (h[num] - i).abs <= k
        h[num] = i
    end
    false
end

#Sliding window solution, best runtime & memory usage.
def contains_nearby_duplicate(nums, k)
    # When k is 0, we are not looking for duplicates and if there is less than 2 elements in nums then there
    # can't be any duplicates.
    if k == 0 || nums.size < 2
        return false
    end

    # Initialize set and add first element. 
    set = {}
    set[nums[0]] = 1
    
    # Using these vars to keep track of our sliding window.
    window_left_index = 0
    window_right_index = k

    # We are starting from first index as we added our first element to our set already.
    nums_index = 1
    while nums_index < nums.size
        if set.include? nums[nums_index]
            return true
        end

        # Add our item to our set.. I mean hash.
        set[nums[nums_index]] = 1

        # Increase our index. 
        nums_index = nums_index + 1

        if window_right_index < nums_index
            # remove item from set from based on window_left_index
            set.delete(nums[window_left_index])
            
            # update window_right_index
            window_right_index = window_right_index + 1

            # update window_left_index
            window_left_index = window_left_index + 1
        end
    end

    return false
end