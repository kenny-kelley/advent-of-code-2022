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
    attr_reader :stacks
    attr_reader :rearrangement_steps
end


# A class representing a single rearrangement step in the overall procedure
class RearrangementStep
    def initialize(number_to_move, source_stack, destination_stack)
        @number_to_move = number_to_move.to_i
        @source_stack = source_stack.to_i - 1
        @destination_stack = destination_stack.to_i - 1
    end
    attr_reader :number_to_move
    attr_reader :source_stack
    attr_reader :destination_stack
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


# Returns a string where each character is the crate on the top of each stack
def get_string_representing_the_top_crates(stacks)
    solution = ""
    stacks.each do |stack|
        solution += stack[stack.length - 1]
    end
    return solution
end


# Performs the rearrangment procedure on the {stacks} according to the {rearrangement_steps}
#   (according to the rules of Part 1)
def perform__part_one_rearrangement_procedure(stacks, rearrangement_steps)
    stacks_copy = Marshal.load(Marshal.dump(stacks))
    rearrangement_steps.each do |rearrangement_step|
        i = 0
        while i < rearrangement_step.number_to_move
            stacks_copy[rearrangement_step.destination_stack].push(stacks_copy[rearrangement_step.source_stack].pop)
            i += 1
        end
    end
    return stacks_copy
end


# Returns the solution to Part 1
def get_part_one_solution(puzzle_input)
    return get_string_representing_the_top_crates(perform__part_one_rearrangement_procedure(puzzle_input.stacks, puzzle_input.rearrangement_steps))
end


# Do the thing
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 05 ###"
    puts "\n"

    puzzle_input = get_puzzle_input

    puts "### Part 1 Solution ###"
    puts get_part_one_solution(puzzle_input)

    puts "\n"

    puts "### Part 2 Solution ###"
    puts "TODO"
end
