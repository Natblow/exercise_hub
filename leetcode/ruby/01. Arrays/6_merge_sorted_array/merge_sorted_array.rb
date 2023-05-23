# frozen_literal_string: true

# Instructions:
# You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
# Merge nums1 and nums2 into a single array sorted in non-decreasing order.
# The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
# Follow up: Can you come up with an algorithm that runs in O(m + n) time?

# Solution with O(m + n) time complexity:
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

# Simple ruby solution:
def merge(nums1, m, nums2, n)
    nums1.slice!(m..-1)
    nums2.slice!(n..-1)
    nums1.concat(nums2).sort!
end

def merge(nums1, m, nums2, n)
    nums1.pop(n)
    nums1.concat(nums2).sort!
end