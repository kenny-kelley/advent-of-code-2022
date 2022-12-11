#!/usr/bin/env ruby

# Advent of Code 2022, Day 08
# Author: Kenny Kelley
# Date: 2022-12-10


# Import from Standard Library
require "set"


# A class that represents the puzzle state for Part 1
class PartOne
    def initialize(tree_grid)
        @tree_grid = tree_grid
        @observed_trees = Set.new
        @tallest_tree_in_view = nil
        self.look_from_left_and_right
        self.look_from_and_top_and_bottom
    end

    attr_reader :observed_trees

    def observe_tree(m, n)
        @observed_trees.add("#{m},#{n}")
        @tallest_tree_in_view = @tree_grid[m][n]
    end

    def attempt_to_observe_tree(m, n)
        if @tree_grid[m][n] > @tallest_tree_in_view
            self.observe_tree(m, n)
        end
    end

    def look_from_left_and_right

        # Iterate over the rows
        (0...@tree_grid.length).each do |m|

            # Iterate over the columns (look from the left side of the grid)
            self.observe_tree(m, 0)
            (0...@tree_grid[m].length).each do |n|
                self.attempt_to_observe_tree(m, n)
            end

            # Iterate over the columns in reverse (look from the right side of the grid)
            self.observe_tree(m, @tree_grid[m].length - 1)
            (0...@tree_grid[m].length).reverse_each do |n|
                self.attempt_to_observe_tree(m, n)
            end
        end
    end

    def look_from_and_top_and_bottom

        # Iterate over the columns
        (0...@tree_grid[0].length).each do |n|

            # Iterate over the rows (look from the top side of the grid)
            self.observe_tree(0, n)
            (0...@tree_grid.length).each do |m|
                self.attempt_to_observe_tree(m, n)
            end

            # # Iterate over the rows in reverse (look from the bottom side of the grid)
            self.observe_tree(@tree_grid.length - 1, n)
            (0...@tree_grid.length).reverse_each do |m|
                self.attempt_to_observe_tree(m, n)
            end
        end
    end
end


# Returns the puzzle input, which is an MxN matrix of integers (meaning M rows and N columns)
def get_tree_grid
    result = Array.new
    File.read("#{__dir__}/input.txt").split("\n").each do |line|
        result.push(line.split("").map(&:to_i))
    end
    return result
end


# Finds the number of trees visible from outside the grid
def find_part_one_solution(tree_grid)
    return PartOne.new(tree_grid).observed_trees.size
end


# Do the thing
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 08 ###"
    puts "\n"

    tree_grid = get_tree_grid

    puts "### Part 1 Solution ###"
    puts find_part_one_solution(tree_grid)
    puts "\n"

    puts "### Part 2 Solution ###"
    puts "TODO"
    puts "\n"
end
