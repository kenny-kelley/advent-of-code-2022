#!/usr/bin/env ruby

# Advent of Code 2022, Day 06
# Author: Kenny Kelley
# Date: 2022-12-06


# Returns the puzzle input, which is a single string
def get_puzzle_input
    return File.read("#{__dir__}/input.txt").strip
end


# Given a {string}, finds the index + 1 of the end of the first substring of length {length}
#   composed entirely of unique characters
def find_end_of_substring_with_unique_characters(string, length)
    most_recent_characters = []
    number_of_characters_to_track = length - 1
    (0...string.length).each do |i|
        if most_recent_characters.length < number_of_characters_to_track
            most_recent_characters.append(string[i])
        else
            if most_recent_characters.include?(string[i]) || most_recent_characters.uniq.length != most_recent_characters.length
                most_recent_characters.shift
                most_recent_characters.append(string[i])
            else
                return i + 1
            end
        end
    end
end


# Finds the index + 1 of the last character of the start-of-packet marker (the solution to Part 1)
def find_part_one_solution(puzzle_input)
    return find_end_of_substring_with_unique_characters(puzzle_input, 4)
end


# Finds the index + 1 of the last character of the start-of-message marker (the solution to Part 2)
def find_part_two_solution(puzzle_input)
    return find_end_of_substring_with_unique_characters(puzzle_input, 14)
end


# Do the thing
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 06 ###"
    puts "\n"

    puzzle_input = get_puzzle_input

    puts "### Part 1 Solution ###"
    puts find_part_one_solution(puzzle_input)

    puts "\n"

    puts "### Part 2 Solution ###"
    puts find_part_two_solution(puzzle_input)
end
