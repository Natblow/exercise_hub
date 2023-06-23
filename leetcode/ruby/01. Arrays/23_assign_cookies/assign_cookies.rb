# frozen_string_literal: true

# Instructions:
# Assume you are an awesome parent and want to give your children some cookies.
# But, you should give each child at most one cookie.
# Each child i has a greed factor g[i], which is the minimum size of a cookie
# that the child will be content with; and each cookie j has a size s[j].
# If s[j] >= g[i], we can assign the cookie j to the child i,
# and the child i will be content.
# Your goal is to maximize the number of your content children and output
# the maximum number.


# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
    g.sort! ; s.sort!
    i = 0 ; j = 0 # i pointer to the current child's greed factor, j pointer to the current cookie size
    count = 0
    while i < g.length and j < s.length
        if g[i] <= s[j]
            count += 1
            i += 1
            j += 1
        else
            j += 1
        end
    end
    count
end