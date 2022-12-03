#!/usr/bin/env ruby

# Author: Kenny Kelley
# Date: 2022-12-02


# Get the input parsed into an Nx2 matrix
def get_parsed_input()
    lines = File.read("#{__dir__}/input.txt").split("\n")
    parsed_input = []
    lines.each do |line|
        parsed_input.append(line.split(" "))
    end
    return parsed_input
end


# Get the score for your choice
def get_choice_score(choice)
    case choice
    when "X" # Rock
        return 1
    when "Y" # Paper
        return 2
    when "Z" # Scissors
        return 3
    end
end


# Naive implementation to get the comparison score of the round (according to Part One's rules)
def get_comparison_score_part_one(round_tuple)
    case round_tuple[0] # Opponent's choice
    when "A" # Rock
        case round_tuple[1] # My choice
        when "X" # Rock
            return 3
        when "Y" # Paper
            return 6
        when "Z" # Scissors
            return 0
        end
    when "B" # Paper
        case round_tuple[1] # My choice
        when "X" # Rock
            return 0
        when "Y" # Paper
            return 3
        when "Z" # Scissors
            return 6
        end
    when "C" # Scissors
        case round_tuple[1] # My choice
        when "X" # Rock
            return 6
        when "Y" # Paper
            return 0
        when "Z" # Scissors
            return 3
        end
    end
end


# Get the score for the round (according to Part One's rules)
def get_round_score_part_one(round_tuple)
    return get_choice_score(round_tuple[1]) + get_comparison_score_part_one(round_tuple)
end


# Get the total score of the game (according to Part One's rules)
def get_total_score_part_one(parsed_input)
    total_score = 0
    parsed_input.each do |round_tuple|
        total_score += get_round_score_part_one(round_tuple)
    end
    return total_score
end


# Main method
if __FILE__ == $0
    parsed_input = get_parsed_input()

    puts "### Part One Solution ###"
    puts get_total_score_part_one(parsed_input)

    puts "\n"

    puts "### Part Two Solution ###"
    puts "TODO"
end
