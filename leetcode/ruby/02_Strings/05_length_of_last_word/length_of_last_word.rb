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

    
# Two pointer recursion solution 
def length_of_last_word(s, word_start_pointer = -1, word_end_pointer = -1)
    return length_of_last_word(s, word_start_pointer - 1, word_end_pointer - 1) if s[word_end_pointer] == ' '
    return length_of_last_word(s, word_start_pointer - 1, word_end_pointer) unless s[word_start_pointer - 1] == ' ' || s[word_start_pointer - 1].nil?
    
    word_end_pointer - word_start_pointer + 1
end