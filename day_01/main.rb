#!/usr/bin/env ruby

if __FILE__ == $0

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

    # Print out the maximum of the number grouping sums
    puts "Solution:"
    puts number_grouping_sums.max

end
