#!/usr/bin/env ruby

# Advent of Code 2022, Day 04
# Author: Kenny Kelley
# Date: 2022-12-04


# Gets the assignments as an Nx2x2 matrix where N is the number of assignment pairs, there are 2
#   assignments in a pair, and there are 2 integers defining an individual assignment's range
def get_assignments
    assignments = []
    File.read("#{__dir__}/input.txt").split("\n").each do |raw_assignment_pair|
        assignment_pair_ranges = []
        raw_assignment_pair.split(",").each do |raw_range|
            assignment_pair_ranges.append(raw_range.split("-").map(&:to_i))
        end
        assignments.append(assignment_pair_ranges)
    end
    return assignments
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
def get_part_one_solution(assignments)
    count = 0
    assignments.each do |ranges|
        if are_ranges_fully_contained_in_each_other(ranges)
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
def get_part_two_solution(assigments)
    count = 0
    assigments.each do |ranges|
        if do_ranges_overlap(ranges)
            count += 1
        end
    end
    return count
end


# Do it
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 04 ###"
    puts "\n"

    assignments = get_assignments

    puts "### Part 1 Solution ###"
    puts get_part_one_solution(assignments)
    puts "\n"

    puts "### Part 2 Solution ###"
    puts get_part_two_solution(assignments)
    puts "\n"
end
