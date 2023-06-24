# frozen_string_literal: true

# Instructions:
# You are given row x col grid representing a map where
# grid[i][j] = 1 represents land and grid[i][j] = 0 
# represents water.

# Grid cells are connected horizontally/vertically (not diagonally).
# The grid is completely surrounded by water, 
# and there is exactly one island (i.e., one or more connected land cells).

# The island doesn't have "lakes", meaning the water
# inside isn't connected to the water around the island.
# One cell is a square with side length 1. 
# The grid is rectangular, width and height don't exceed 100.
# Determine the perimeter of the island.

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
    perimeter = 0
    m = grid.length - 1
    n = grid[0].length - 1

    perimeter = 0
    (0..m).each do |y|
        (0..n).each do |x|
            if grid[y][x] == 1
                perimeter += 1 if y == 0 || grid[y-1][x] == 0
                perimeter += 1 if y == m || (y < m && grid[y+1][x] == 0)
                perimeter += 1 if x == 0 || grid[y][x-1] == 0
                perimeter += 1 if x == n || (x < n && grid[y][x+1] == 0)
            end
        end
    end

    perimeter
end

def island_perimeter(grid)
    perimeter = 0
    grid.each_with_index do |row, i|
        row.each_with_index do |cell, j|
            if cell == 1
                perimeter += 4
                perimeter -= 2 if i > 0 and grid[i-1][j] == 1
                perimeter -= 2 if j > 0 and grid[i][j-1] == 1
            end
        end
    end
    perimeter
end

# Time complexity: O(n*m) where n is the number of rows and m is the number of columns
# Space complexity: O(1) because we are not using any extra space
# Runtime: 136 ms, faster than 100.00% of Ruby online submissions for Island Perimeter.

