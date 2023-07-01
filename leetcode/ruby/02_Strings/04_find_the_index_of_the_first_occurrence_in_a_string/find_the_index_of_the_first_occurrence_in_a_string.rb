# frozen_string_literal: true

# Instructions:
# Given two strings needle and haystack, 
# return the index of the first occurrence
# of needle in haystack, or -1 if needle 
# is not part of haystack.

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    haystack.include?(needle) ? haystack.index(needle) : -1
end

def str_str(haystack, needle)
    # index for haystack and needle
    i = 0
    j = 0 
    # iterate down length of haystack
    while i < haystack.length
        # haystack at current index matches first char of needle
        if haystack[i] == needle[j]
            # copy index to tmp to not lose track of haystack index
            tmp = i
            # while they continue to match, increment both tmp and needle index until end of needle
            while haystack[tmp] == needle[j] and j < needle.length
                j += 1
                tmp += 1 
            end
        end
        # j incremented to needle.length signifies full match so return i
        if j == needle.length
            return i
        end
        # otherwise increment haystack and reset needle index for next iteration
        i += 1
        j = 0
    end
    # no match
    return -1
end