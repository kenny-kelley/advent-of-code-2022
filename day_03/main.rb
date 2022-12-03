#!/usr/bin/env ruby

# Advent of Code 2022, Day 03
# Author: Kenny Kelley
# Date: 2022-12-03


# Declare constants
POSSIBLE_ITEMS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"


# Get the first and second half of a string as a tuple
def get_string_halves(string)
    return [string[0, string.size / 2], string[string.size / 2, string.size - 1]]
end


# Get the input parsed into an Nx2 matrix where N is the number "rucksacks" and 2 is the number of
#   "compartments" in each "rucksack"
def get_parsed_input()
    lines = File.read("#{__dir__}/input.txt").split("\n")
    parsed_input = []
    lines.each do |line|
        parsed_input.append(get_string_halves(line))
    end
    return parsed_input
end


# Get the "item" found in both "compartments" of the "rucksack"
def get_duplicate_item(rucksack)
    return (rucksack[0].split("") & rucksack[1].split("")).join
end


# Get the priority of the given "item" (we're assuming {item} is a character in [a, z] or [A, Z])
def get_item_priority_value(item)
    return POSSIBLE_ITEMS.index(item) + 1
end


# Get the sum of the priority of each "item" that is found in both "compartments" of each
#   "rucksack"
def get_duplicate_item_priority_values_sum(parsed_input)
    duplicate_item_priority_values_sum = 0
    parsed_input.each do |rucksack|
        duplicate_item_priority_values_sum += get_item_priority_value(get_duplicate_item(rucksack))
    end
    return duplicate_item_priority_values_sum
end


# Do ALL the things!
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 03 ###"
    puts "\n"

    parsed_input = get_parsed_input()

    puts "### Part 1 Solution ###"
    puts get_duplicate_item_priority_values_sum(parsed_input)

    puts "\n"

    puts "### Part 2 Solution ###"
    puts "TODO"
end
