# Intuition
<!-- Describe your first thoughts on how to solve this problem. -->

# Approach
<!-- Describe your approach to solving the problem. -->
 1. We convert the given array to an integer & then increment 1

Using `inject` , if digits = [4,2,3] then it goes :

`0*10 + 4 = 4` then `4*10 + 2 = 42` then `42*10 + 3 = 423`
`large_int = 423 + 1`

For better understanding of the inject method, you may want to read this step by step explanation : https://stackoverflow.com/a/38351263/15966336

 2. We convert back the integer to array and return the result
 
    ```ruby
    424.to_s #=> "424"
    "424".chars #=> ["4","2","4"] 
    ["4","2","4"].map(&:to_i) #=> [4,2,4]

    ```


# Code
```ruby
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
    large_int = digits.inject{|accumulator, element| accumulator*10 + element} + 1
    large_int.to_s.chars.map(&:to_i)
end
```

Other solution : 

```ruby
# @param {Integer[]} digits
# @return {Integer[]}
    
def plus_one(digits)
    (digits.join.to_i + 1).to_s.chars.map(&:to_i)
end
```