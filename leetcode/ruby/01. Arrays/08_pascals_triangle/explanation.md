# Intuition

The Pascal Triangle nicely highlights the fundamental idea of Dynamic Programming by making use of previously calculated solution to calculate the next. In this case, we use the previously calculated row to our advantage, as the problem description suggests.

# Approach

After some known base cases, use the previous row to calculate all new values of the next row. Ruby's each_cons makes the use of a sliding window easy.

# Complexity

* Time complexity:
∑i=0ni\sum_{i=0}^n{i}∑i=0n​i steps are taken (one for each triangle cell), with n being the number of rows. So, O(n^2)

* Space complexity:
We need one array to store the row as it is being calculated. It has at most length of num_rows, hence O(n)

# Code

```ruby
# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)  
    triangle = []
    num_rows.times do |i|
        case i 
        when 0 then row = [1]    # base case first row
        when 1 then row = [1, 1] # base case second row
        else
            # Start the new row
            row = [1]
            # Collect the middle of the new row using a sliding
            # window of two that sums pairs of the previous row
            prev_row = triangle[-1]
            prev_row.each_cons(2) do |(i ,j)|
                row << i + j
            end
            # Finish the row
            row << 1
        end
        triangle << row
    end
    triangle
end
```