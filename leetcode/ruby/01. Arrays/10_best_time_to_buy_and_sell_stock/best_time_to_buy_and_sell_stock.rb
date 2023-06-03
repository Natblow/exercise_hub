# frozen_string_literal: true

# Instructions:
# You are given an array prices where prices[i] is the price of a given stock on the ith day.
# You want to maximize your profit by choosing a single day to buy one stock and choosing a
# different day in the future to sell that stock.
# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    return 0 unless prices.size > 1
    
    max_profit = 0
    min_price = prices[0]
    
    prices.each do |price|
        if price > min_price
            max_profit = [max_profit, price - min_price].max
        else
            min_price = price
        end
    end
    
    max_profit  
end

def max_profit(prices)
    min = prices[0]
    max = 0
    prices.each do |p|
        min = p if p < min
        temp = p - min
        max = temp if temp > max
    end
    return max
end

# left = buy, right = sell
def max_profit(prices)
    l = 0 # start left at beginning
    r = 1 # right pointer is one head
    max_profit = 0 # init max
    while r != prices.length # until we have searched the entire list
        if prices[l] < prices[r] # if we find a profit
            max_profit = [max_profit, prices[r] - prices[l]].max # store it if max profit so far
        else # no profit, so weve found the max profit for that left pointer value
            l = r # set it to r 
        end
        r += 1 # iterate r regardless
    end
    return max_profit
end