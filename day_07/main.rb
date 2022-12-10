#!/usr/bin/env ruby

# Advent of Code 2022, Day 07
# Author: Kenny Kelley
# Date: 2022-12-07


# Define constants
ONE_HUNDRED_THOUSAND = 100000


# A class representing a directory in the filesystem described in the puzzle
class Dir
    def initialize(name, parent)
        @name = name
        @parent = parent
        @subdirs = Array.new
        @files = Hash.new
        @size = nil
    end

    attr_reader :name
    attr_reader :parent
    attr_reader :subdirs
    attr_reader :files
    attr_reader :size

    def to_s
        return "Dir(name=\"#{@name}\", subdirs=#{@subdirs.inspect}, files=#{@files.inspect}, size=#{@size})"
    end

    def inspect
        return "Dir(name=\"#{name}\", size=#{@size})"
    end

    def add_subdir(dir)
        @subdirs.append(dir)
    end

    def add_file(file_name, file_size)
        @files[file_name] = file_size
    end

    def find_subdir_from_name(file_name)
        result = nil
        @subdirs.each do |subdir|
            if subdir.name == file_name
                result = subdir
            end
        end
        return result
    end

    def compute_size
        if @size == nil
            @size = 0
        end
        @subdirs.each do |subdir|
            @size += subdir.compute_size
        end
        @files.each_value do |file_size|
            @size += file_size
        end
        return @size
    end
end


# Parses the puzzle input into a {Dir} representing the root directory
def get_root_dir
    root_dir = Dir.new("/", nil)
    working_dir = root_dir
    File.read("#{__dir__}/input.txt").split("\n") do |line|
        tokens = line.split(" ")
        if tokens[0] == "$"
            if tokens[1] == "cd" && tokens[2] != "/"
                if tokens[2] == ".."
                    working_dir = working_dir.parent
                else
                    working_dir = working_dir.find_subdir_from_name(tokens[2])
                end
            end
        elsif tokens[0] == "dir"
            working_dir.add_subdir(Dir.new(tokens[1], working_dir))
        elsif tokens[0] =~ /[1-9]/
            working_dir.add_file(tokens[1], tokens[0].to_i)
        end
    end
    return root_dir
end


# Finds the sum of the directories that are less than or equal to 100,000 in size
def find_part_one_solution(dir)
    sum = 0
    if dir.name != "/" && dir.size <= ONE_HUNDRED_THOUSAND
        sum += dir.size
    end
    dir.subdirs.each do |subdir|
        sum += find_part_one_solution(subdir)
    end
    return sum
end


# Do the thing
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 07 ###"
    puts "\n"

    root_dir = get_root_dir
    root_dir.compute_size

    puts "### Part 1 Solution ###"
    puts find_part_one_solution(root_dir)
    puts "\n"

    puts "### Part 2 Solution ###"
    puts "TODO"
    puts "\n"
end
