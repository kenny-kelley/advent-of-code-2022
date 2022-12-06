#!/usr/bin/env ruby

# Advent of Code 2022, Day 05
# Author: Kenny Kelley
# Date: 2022-12-05


# A class representing the puzzle input
class PuzzleInput
    def initialize(stacks, rearrangement_steps)
        @stacks = stacks
        @rearrangement_steps = rearrangement_steps
    end
end


# A class representing a single rearrangement step in the overall procedure
class RearrangementStep
    def initialize(number_to_move, source_stack, destination_stack)
        @number_to_move = number_to_move
        @source_stack = source_stack
        @destination_stack = destination_stack
    end
end


# Gets the number of stacks from the string of stack numbers
def get_number_of_stacks(raw_stack_numbers)
    return raw_stack_numbers.split(" ").length
end


# Returns an array of length {number_of_stacks} of empty arrays
def get_empty_stacks(number_of_stacks)
    empty_stacks = []
    (0...number_of_stacks).each do
        empty_stacks.append([])
    end
    return empty_stacks
end


# Returns an array of arrays representing the crate stacks
def get_stacks(raw_stacks)
    lines = raw_stacks.split("\n")
    number_of_stacks = get_number_of_stacks(lines.pop)
    stacks = get_empty_stacks(number_of_stacks)
    lines.reverse.each do |line|
        line_index = 0
        stack_number = 0
        while line_index < line.length
            if line[line_index] == "["
                stacks[stack_number].push(line[line_index + 1])
            end
            line_index += 4
            stack_number += 1
        end
    end
    return stacks
end


# Returns an array of {RearrangementStep} objects
def get_rearrangement_steps(raw_rearrangement_steps)
    lines = raw_rearrangement_steps.split("\n")
    rearrangement_steps = []
    lines.each do |line|
        split_line = line.split(" ")
        split_line.delete("move")
        split_line.delete("from")
        split_line.delete("to")
        rearrangement_steps.append(RearrangementStep.new(split_line[0], split_line[1], split_line[2]))
    end
    return rearrangement_steps
end


# Returns a {PuzzleInput} object
def get_puzzle_input
    raw_puzzle_input = File.read("#{__dir__}/input.txt").split("\n\n")
    puzzle_input = PuzzleInput.new(get_stacks(raw_puzzle_input[0]), get_rearrangement_steps(raw_puzzle_input[1]))
    return puzzle_input
end


# Do the thing
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 05 ###"
    puts "\n"

    puzzle_input = get_puzzle_input

    puts "### Part 1 Solution ###"
    puts "TODO"

    puts "\n"

    puts "### Part 2 Solution ###"
    puts "TODO"
end
