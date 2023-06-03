# frozen_literal_string: true

# Instructions:
# Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
# Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
# Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
# Return k.

def remove_duplicates(nums)
    return 0 if nums.length == 0 

    nums.each_with_index do |num, i| # iterate through the array
        nums[i] == nums[i+1] ? nums[i] = nil : next # if the current number is the same as the next number, set the current number to nil, otherwise, continue
    end
    nums.delete(nil) # delete all nils from the array and return the length of the array
end

# Alternative easy solution, thanks to the wonderful Ruby language. Almost same runtime speed & memory usage as the above solution:

def remove_duplicates(nums)
    nums.uniq!
    nums.length
end