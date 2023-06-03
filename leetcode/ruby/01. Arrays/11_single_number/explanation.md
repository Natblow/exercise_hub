# Approach

Using the XOR operator all the duplicates will cancel out leaving only the non-duplicate number.

This task is based on the rule that `x xor x = 0 and 0 xor x = x`. Because there is only one unique number and set of pairs in the input, all pairs would be `0`, and `0` xor unique number would be that unique number.

```
a ^ b ^ a ^ c ^ c = b 
```

# Complexity

* Time complexity:

    O(n)

* Space complexity:

    O(1)

# Code

```ruby
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    out = 0
    nums.each do |num|
        out ^= num
    end
    out
end
```
