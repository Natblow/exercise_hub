# frozen_string_literal: true

# Instructions:
# Given a string s consisting of words and
# spaces, return the length of the last word
# in the string.

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    s.split(' ').last.length
end

# Two pointer solution
def length_of_last_word(s)
    word_end_pointer = word_start_pointer = -1
    
    while s[word_end_pointer] == ' '
        word_start_pointer -= 1
        word_end_pointer -= 1
    end
    
    while s[word_start_pointer - 1] != ' ' && !s[word_start_pointer - 1].nil?
        word_start_pointer -= 1
    end
        
    word_end_pointer - word_start_pointer + 1
end

    
# Two pointer recursion solution 
def length_of_last_word(s, word_start_pointer = -1, word_end_pointer = -1)
    return length_of_last_word(s, word_start_pointer - 1, word_end_pointer - 1) if s[word_end_pointer] == ' '
    return length_of_last_word(s, word_start_pointer - 1, word_end_pointer) unless s[word_start_pointer - 1] == ' ' || s[word_start_pointer - 1].nil?
    
    word_end_pointer - word_start_pointer + 1
end


def length_of_last_word(s)
    # reverse the string
    s = s.reverse!

    # initialize counters
    cursor = 0
    len = 0
    count = false

    while cursor < s.length
      # codepoint of 32 equates to a space
      if s[cursor].ord == 32 and count == false
        cursor += 1

      # start counting on non space codepoints
      elsif s[cursor].ord != 32
        count = true
        len += 1
        cursor += 1

      # stop counting
      elsif s[cursor].ord == 32 and count == true
        return len
      end
      
    end
    return len
end