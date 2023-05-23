# Intuition

As description tells us, we already have all needed space in the first array which is logicaly split in two halfs: first one from 0 to m, contains sorted numbers(of first array) and second one from m to n + m - 1 is simply empty allocated space which means that we basically need to move all elements from second array to first one. In order to preserve numbers in the first logical array we need to start merging from the end, otherwise if numbers in array #2 will be less than numbers in array #1, first array will be overridden by second, or we would have to add more unnecessary complexity to our algorithm.


# Code

```ruby
def merge(nums1, m, nums2, n)
  i = nums1.length - 1
  m -= 1 
  n -= 1

  while i >= 0 && n >= 0 
    if m >= 0 && nums1[m] > nums2[n]
      nums1[i] = nums1[m]
      m -= 1
    else
      nums1[i] = nums2[n]
      n -= 1
    end
    i -= 1 
  end
end
```


# Approach

In order to solve this problem we need 3 pointers, two of them we already got in inputs: `n` and `m` which is lengthes of the first and the second arrays(but we'll need to substract `1` from both of them because indexing of the array starts from `0`), thus we only need to define third one: `i` and set it to length of the first array minus `1`(which actually is `n + m - 1`).

At this point all that's left is to design a loop in order to compare all numbers one by one and store them in place in the first array. When determining our conditions for the loop and inner ifs(that compare actuall numbers) we need to designate two major states of the inputs: `m >= n` and `n <= m`.

First one means that we should stop process when `n` pointer is less than `0` and return first array, all previous comparisons already has been made and arrays are fully merged because we started from the end and we using space from the first array, thus if `m >= n` and we run out of numbers in the second array we can conclude that the rest `m - n` elements in the first array are also in their corresponding positions.

We can achieve that by simply terminating the loop on this condition:

`i >= 0 && n >= 0`

Second one means that when `m` pointer is equal to `0`(which means we run out of numbers in the first logical array), we just need to place all the rest `n - m` numbers from the second array into corresponding ith positions in the first one according to their original order.

We can achieve that by adding an `AND` condition to the comparison of numbers:

`m >= 0 && nums1[m] > nums2[n]`


# Complexity

* Time complexity:

    O(n + m)

* Space complexity:

    O(n + m)
