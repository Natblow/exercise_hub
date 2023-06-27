# frozen_string_literal: true

# Instructions:
# Write a function to find the longest common 
# prefix string amongst an array of strings.
# If there is no common prefix, return an empty string "".

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    prefix = ""
    length = strs.map { |s| s.length }.min
    0.upto(length - 1) do |i|
        char = strs[0][i]
        strs.each { |s| return prefix if s[i] != char }
        prefix += char
    end
    prefix
end

def longest_common_prefix(strs)
    strs.inject do |r, s|
        r[0...(r.chars.zip(s.chars).take_while{|c, d| c == d }.size)]
    end
end

#Trie solutions :

###### 1 ######
def longest_common_prefix(strs)
    root = TrieNode.new("")
    strs.each do |s|
        return "" if s.eql?("")
        node = root
        s.split("").each do |a|
            if node.children.key?(a)
                node = node.children[a]
            else
                newNode = TrieNode.new(a)
                node.children[a] = newNode
                node = newNode
            end
        end
        node.word = s
    end

    min = strs.sort_by(&:length).first.length
    str = ''
    (0...min).each do |a|
        return str unless root.children.size == 1
        ch = root.children.keys.first
        str = str.concat(ch)
        root = root.children[ch]
    end

    str
end

class TrieNode
    attr_accessor :val
    attr_accessor :word
    attr_accessor :children

    def initialize(val)
        @val = val
        @children = {}
    end
end

###### 2 ######

def longest_common_prefix(strs)
    return "" if strs.any?(&:empty?)
    node = Trie.new
    strs.map(&:chars).each { |chars| node.insert(chars) }
    common = ""
    while node.bifurcation==1 && !node.is_end
        common << node.first_key
        node = node.first_value
    end
    common
end

class Trie
    attr_accessor :is_end
    def initialize = @data = {}

    def [](index) = @data[index]
    def []=(index, value)
        @data[index] = value
    end

    def bifurcation = @data.size
    def first_key = @data.keys.first
    def first_value = @data.values.first

    def insert(chars)
        node = self
        for c in chars
            node[c] ||= Trie.new
            node = node[c]
        end
        node.is_end = true
    end

    def has(chars)
        node = self
        for c in chars
            return false unless node[c]
            node = node[c]
        end
        node.is_end
    end

    def prefix(chars)
        node = self
        for c in chars
            return false unless node[c]
            node = node[c]
        end
        true
    end
end
