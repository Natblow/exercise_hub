# Intuition

Because the problem calls for *`O(logn)`* time complexity, you cannot iterate through each index.

# Approach

Use a binary search algorithm, which is an efficient way for finding an item from a sorted list of items



# Code

```ruby
# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

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
```