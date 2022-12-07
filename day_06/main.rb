#!/usr/bin/env ruby

# Advent of Code 2022, Day 06
# Author: Kenny Kelley
# Date: 2022-12-06


# Returns the puzzle input, which is a single string
def get_puzzle_input
    return File.read("#{__dir__}/input.txt").strip
end


# Finds the solution to Part 1
def find_part_one_solution(puzzle_input)
    most_recent_characters = []
    (0...puzzle_input.length).each do |i|
        if most_recent_characters.length < 3
            most_recent_characters.append(puzzle_input[i])
        else
            if most_recent_characters.include?(puzzle_input[i]) || most_recent_characters.uniq.length != most_recent_characters.length
                most_recent_characters.shift
                most_recent_characters.append(puzzle_input[i])
            else
                return i + 1
            end
        end
    end
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
    puts "TODO"
end
