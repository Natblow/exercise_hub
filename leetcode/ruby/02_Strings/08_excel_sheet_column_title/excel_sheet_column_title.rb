# frozen_string_literal: true

# Instructions:
# Given an integer column_number, 
# return its corresponding column 
# title as it appears in an Excel sheet.

# For example:
# A -> 1
# B -> 2
# C -> 3
# ...
# Z -> 26
# AA -> 27
# AB -> 28
# ...


# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  result = ""
    while column_number > 0
      remainder = (column_number - 1) % 26
      result.prepend((remainder + "A".ord).chr)
      column_number = (column_number - 1) / 26
    end
  result
end

def convert_to_title(column_number)
    result      = ''
    alphabet    = ("A".."Z").to_a
   
    while column_number != 0
        result = alphabet[(column_number % 26) - 1] + result
        column_number = (column_number - 1) / 26
    end

    result
end