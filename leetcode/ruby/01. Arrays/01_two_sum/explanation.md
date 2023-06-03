# Intuition

Brute force is ok, but it can't pass the last test cases because of the time complexity. Here is the solution.
# Approach

Create a hash to store numbers with their indexes.
Go through each number in the array with it's index.
Subtract the current number from the target beacuse the logic is:

```
x + y = target
```

Since we got a number from the iteration and a target number, logic can be transalted to this:

```
current_number + needed_number = target
```

As we are looking for the needed_number, logic becomes this:

```
needed_number = target - current_number
```

* Look for the needed_number from the hash.
    * `if needed_number is present`
        * Return the index of the needed_number, it means we encountered it before while we were looping through the array.
        else
    * `else`
        * Store this current_number in the hash as it might become the needed_number in the next iteration.

# Complexity

* Time complexity:

    The time complexity of this code is O(n), where n is the number of elements in the input array nums. This is because the code iterates through the array once using the each_with_index method, which has a linear time complexity of O(n). Within the loop, the code performs constant-time operations like hash lookups and assignments, which do not contribute to the overall time complexity.

* Space complexity:

    The space complexity of this code is O(n), where n is the number of elements in the input array nums. This is because the code uses a hash table to store the index of each element in nums, which has a space complexity of O(n) in the worst case (when all elements in nums are distinct). Therefore, the space required by the hash table grows linearly with the size of the input array.

# Code

```ruby
# frozen_string_literal: true

def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |current_number, index|
    needed_number = target - current_number

    return [hash[needed_number], index] if hash[needed_number]

    hash[current_number] ||= index
  end
end
```