#!/usr/bin/env ruby

# Advent of Code 2022, Day 08
# Author: Kenny Kelley
# Date: 2022-12-10


# Import from Standard Library
require "set"


# Returns the puzzle input, which is an MxN matrix of integers (meaning M rows and N columns)
def get_tree_grid
    result = Array.new
    File.read("#{__dir__}/input.txt").split("\n").each do |line|
        result.push(line.split("").map(&:to_i))
    end
    return result
end


# TODO: Write a method description
def update_observed_trees(observed_trees, n, m)
    observed_trees.add("#{m},#{n}")
end


# TODO: Write a method description
def look_from_left_and_right(tree_grid, observed_trees)

    # Iterate over the rows
    (0...tree_grid.length).each do |m|

        # Iterate over the columns (look from the left side of the grid)
        tallest_tree_so_far = tree_grid[m][0]
        update_observed_trees(observed_trees, m, 0)
        (0...tree_grid[m].length).each do |n|
            if tree_grid[m][n] > tallest_tree_so_far
                tallest_tree_so_far = tree_grid[m][n]
                update_observed_trees(observed_trees, m, n)
            end
        end

        # Iterate over the columns in reverse (look from the right side of the grid)
        tallest_tree_so_far = tree_grid[m][tree_grid[m].length - 1]
        update_observed_trees(observed_trees, m, tree_grid[m].length - 1)
        (0...tree_grid[m].length).reverse_each do |n|
            if tree_grid[m][n] > tallest_tree_so_far
                tallest_tree_so_far = tree_grid[m][n]
                update_observed_trees(observed_trees, m, n)
            end
        end
    end
end


# TODO: Write a method description
def look_from_and_top_and_bottom(tree_grid, observed_trees)

    # Iterate over the columns
    (0...tree_grid[0].length).each do |n|

        # Iterate over the rows (look from the top side of the grid)
        tallest_tree_so_far = tree_grid[0][n]
        update_observed_trees(observed_trees, 0, n)
        (0...tree_grid.length).each do |m|
            if tree_grid[m][n] > tallest_tree_so_far
                tallest_tree_so_far = tree_grid[m][n]
                update_observed_trees(observed_trees, m, n)
            end
        end

        # # Iterate over the rows in reverse (look from the bottom side of the grid)
        tallest_tree_so_far = tree_grid[tree_grid.length - 1][n]
        update_observed_trees(observed_trees, tree_grid.length - 1, n)
        (0...tree_grid.length).reverse_each do |m|
            if tree_grid[m][n] > tallest_tree_so_far
                tallest_tree_so_far = tree_grid[m][n]
                update_observed_trees(observed_trees, m, n)
            end
        end
    end
end


# TODO: Write a method description
def find_part_one_solution(tree_grid)
    observed_trees = Set.new
    look_from_left_and_right(tree_grid, observed_trees)
    look_from_and_top_and_bottom(tree_grid, observed_trees)
    return observed_trees.size
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
