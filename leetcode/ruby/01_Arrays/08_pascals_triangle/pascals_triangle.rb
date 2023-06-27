# frozen_string_literal: true

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