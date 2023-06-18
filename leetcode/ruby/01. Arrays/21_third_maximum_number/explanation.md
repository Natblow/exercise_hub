# Intuition

We used long integer variable because the minimum possible value in the input array was −2e31, and initially, we need to store a value lower than this and used it to check if `thirdMax` was updated or not.

But, we can also keep some boolean variables to indicate if `firstMax`, `secondMax`, `thirdMax` were ever changed or not.
Thus, here we keep pairs of int (to store the int variable) and boolean (to show if the number was ever updated).

# Algorithm

1. ##### Initialize variables:
    * `firstMax`, `secondMax`, and `thirdMax`, pairs of int and bool, where bool must be `false` to show they are not updated.

2. ##### Iterate on all numbers of the `nums` array:
    * If the current number is already stored in any of three variables we will skip this number.
    * If `firstMax` was never updated or the current number is greater than `firstMax`, update all three variables. And mark `firstMax` updated as true.
    * Otherwise, if `secondMax` was never updated or the current number is greater than `secondMax`, update `secondMax` and `thirdMax`. And mark `secondMax` updated as true.
    * Otherwise, if `thirdMax` was never updated or the current number is greater than `thirdMax`, update `thirdMax`. And mark `thirdMax` updated as true.

3. ##### If `thirdMax` was not updated, then return the largest number stored in `firstMax`.

    Otherwise, return the third largest number stored in `thirdMax`.

# Implementation
```
# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  first_max = [-1, false]
  second_max = [-1, false]
  third_max = [-1, false]

  nums.each do |num|
    # If current number is already stored, skip it.
    next if (first_max[1] && first_max[0] == num) ||
            (second_max[1] && second_max[0] == num) ||
            (third_max[1] && third_max[0] == num)

    # If we never stored any variable in first_max
    # or curr num is bigger than first_max, then curr num is the biggest number.
    if !first_max[1] || first_max[0] <= num
      third_max = second_max
      second_max = first_max
      first_max = [num, true]
    # If we never stored any variable in second_max
    # or curr num is bigger than second_max, then curr num is the 2nd biggest number.
    elsif !second_max[1] || second_max[0] <= num
      third_max = second_max
      second_max = [num, true]
    # If we never stored any variable in third_max
    # or curr num is bigger than third_max, then curr num is the 3rd biggest number.
    elsif !third_max[1] || third_max[0] <= num
      third_max = [num, true]
    end
  end

  # If third max was never updated, it means we don't have 3 distinct numbers.
  return first_max[0] unless third_max[1]

  third_max[0]
end

```

# Complexity Analysis

If N is the number of elements in the input array.

* Time complexity: O(N).
        We iterate on the `nums` array once. Thus, overall it takes O(N) time.

* Space complexity: O(1).
        We only used three extra variables.