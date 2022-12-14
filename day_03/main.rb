#!/usr/bin/env ruby

# Advent of Code 2022, Day 03
# Author: Kenny Kelley
# Date: 2022-12-03


# Declare constants
POSSIBLE_ITEMS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"


# Get the input parsed into an array of length N where N is the number "rucksacks"
def get_parsed_input()
    return File.read("#{__dir__}/input.txt").split("\n")
end


# Get the two "compartments" of a "rucksack" (in other words, split the string in half)
def get_compartments(rucksack)
    return [rucksack[0, rucksack.size / 2], rucksack[rucksack.size / 2, rucksack.size - 1]]
end


# Get the "item" found in both "compartments" of the "rucksack"
def get_duplicate_item(compartments)
    return (compartments[0].split("") & compartments[1].split("")).join
end


# Get the priority of the given "item" (we're assuming {item} is a character in [a, z] or [A, Z])
def get_item_priority_value(item)
    return POSSIBLE_ITEMS.index(item) + 1
end


# Get the sum of the priority of each "item" that is found in both "compartments" of each
#   "rucksack" (this is the solution to Part 1)
def get_duplicate_item_priority_values_sum(parsed_input)
    duplicate_item_priority_values_sum = 0
    parsed_input.each do |rucksack|
        duplicate_item_priority_values_sum += get_item_priority_value(get_duplicate_item(get_compartments(rucksack)))
    end
    return duplicate_item_priority_values_sum
end


# Get the common "item" in the group's "rucksacks" (we're assuming {group} is an array of length 3)
def get_common_item(group)
    return (group[0].split("") & group[1].split("") & group[2].split("")).join
end


# Get the sum of the priority of each "item" that is found in every "rucksack" for each group of 3
#   "rucksacks" (this the solution to Part 2)
def get_common_item_priority_values_sum(parsed_input)
    common_item_priority_values_sum = 0
    (0...parsed_input.size).step(3).each do |i|
        common_item_priority_values_sum += get_item_priority_value(get_common_item(parsed_input[i, 3]))
    end
    return common_item_priority_values_sum
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
    puts get_common_item_priority_values_sum(parsed_input)
    puts "\n"
end
