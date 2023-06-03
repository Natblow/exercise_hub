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