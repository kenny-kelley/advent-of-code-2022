#!/usr/bin/env ruby

# Advent of Code 2022, Day 04
# Author: Kenny Kelley
# Date: 2022-12-04


# Get the input parsed into an array of length N where N is the number pairs
def get_lines
    return File.read("#{__dir__}/input.txt").split("\n")
end


# Split the raw pair string
def get_pair(raw_pair)
    return raw_pair.split(",")
end


# Split the raw range string and convert them to integers
def get_range(raw_range)
    return raw_range.split("-").map(&:to_i)
end


# Get the ranges for a given pair
def get_ranges(pair)
    ranges = []
    pair.each do |raw_range|
        ranges.append(get_range(raw_range))
    end
    return ranges
end


# Returns whether or not {range_a} is fully contained in {range_b}
def is_range_a_fully_contained_in_range_b(range_a, range_b)
    return range_a[0] >= range_b[0] && range_a[1] <= range_b[1]
end


# Returns whether or not the ranges are fully contained in each other
def are_ranges_fully_contained_in_each_other(ranges)
    return is_range_a_fully_contained_in_range_b(ranges[0], ranges[1]) || is_range_a_fully_contained_in_range_b(ranges[1], ranges[0])
end


# Count the number of assignment pairs where the ranges are fully contained in each other
def get_part_one_solution(lines)
    count = 0
    lines.each do |raw_pair|
        if are_ranges_fully_contained_in_each_other(get_ranges(get_pair(raw_pair)))
            count += 1
        end
    end
    return count
end


# Returns whether or not the ranges overlap
def do_ranges_overlap(ranges)
    return ranges[0][1] >= ranges[1][0] && ranges[0][0] <= ranges[1][1]
end


# Count the number of assignment pairs where the ranges overlap
def get_part_two_solution(lines)
    count = 0
    lines.each do |raw_pair|
        if do_ranges_overlap(get_ranges(get_pair(raw_pair)))
            count += 1
        end
    end
    return count
end


# Do it
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 04 ###"
    puts "\n"

    lines = get_lines

    puts "### Part 1 Solution ###"
    puts get_part_one_solution(lines)

    puts "\n"

    puts "### Part 2 Solution ###"
    puts get_part_two_solution(lines)
end
