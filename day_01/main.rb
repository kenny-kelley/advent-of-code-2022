#!/usr/bin/env ruby

# Advent of Code 2022, Day 01
# Author: Kenny Kelley
# Date: 2022-12-01


# Returns an array of the sums of each number grouping in input.txt
def get_number_grouping_sums()

    # Read in the number groupings and split on each double newline
    number_groupings = File.read("#{__dir__}/input.txt").split("\n\n")

    # Declare an array to save the number grouping sums in
    number_grouping_sums = []

    # Iterate over each number grouping
    number_groupings.each do |number_grouping|

        # Split the number grouping on each newline, convert them all to integers, sum those
        #   integers, then append that sum to the array of number grouping sums
        number_grouping_sums.append(number_grouping.split("\n").map(&:to_i).sum)
    end

    return number_grouping_sums
end


# Returns an array of the {x} highest values in an array of integers
def get_highest_values(values, x)

    # Initialize an array to keep track of the {x} highest values
    highest_values = []

    # Iterate over ever each {value}
    values.each do |value|

        # If we haven't saved {x} values yet, store this {value}
        if highest_values.size < x
            highest_values.append(value)

        # If this {value} is greater than the minimum of the highest values encountered so far,
        #   delete the first instance of the minimum and append this {value}
        elsif value > highest_values.min
            highest_values.delete_at(highest_values.find_index(highest_values.min))
            highest_values.append(value)
        end
    end

    return highest_values
end


# Do ALL the things!
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 01 ###"
    puts "\n"

    # Get the sums of each number grouping
    number_grouping_sums = get_number_grouping_sums()

    # Print the max of those sums
    puts "### Part 1 Solution ###"
    puts number_grouping_sums.max

    puts "\n"

    # Print the sum of the highest three of those sums
    puts "### Part 2 Solution ###"
    puts get_highest_values(number_grouping_sums, 3).sum
end
