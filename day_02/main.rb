#!/usr/bin/env ruby

# Advent of Code 2022, Day 02
# Author: Kenny Kelley
# Date: 2022-12-02


# Declare constants
ROCK_SCORE = 1
PAPER_SCORE = 2
SCISSORS_SCORE = 3
LOSS_SCORE = 0
DRAW_SCORE = 3
WIN_SCORE = 6


# Get the input parsed into an Nx2 matrix
def get_parsed_input()
    lines = File.read("#{__dir__}/input.txt").split("\n")
    parsed_input = []
    lines.each do |line|
        parsed_input.append(line.split(" "))
    end
    return parsed_input
end


# Get the score for my choice (according to Part 1's rules)
def get_choice_score_part_one(choice)
    case choice
    when "X" # Rock
        return ROCK_SCORE
    when "Y" # Paper
        return PAPER_SCORE
    when "Z" # Scissors
        return SCISSORS_SCORE
    end
end


# Get the outcome score of the round (according to Part 1's rules)
def get_outcome_score_part_one(round_tuple)
    case round_tuple[0] # Opponent's choice
    when "A" # Rock
        case round_tuple[1] # My choice
        when "X" # Rock
            return DRAW_SCORE
        when "Y" # Paper
            return WIN_SCORE
        when "Z" # Scissors
            return LOSS_SCORE
        end
    when "B" # Paper
        case round_tuple[1] # My choice
        when "X" # Rock
            return LOSS_SCORE
        when "Y" # Paper
            return DRAW_SCORE
        when "Z" # Scissors
            return WIN_SCORE
        end
    when "C" # Scissors
        case round_tuple[1] # My choice
        when "X" # Rock
            return WIN_SCORE
        when "Y" # Paper
            return LOSS_SCORE
        when "Z" # Scissors
            return DRAW_SCORE
        end
    end
end


# Get the score for the round (according to Part 1's rules)
def get_round_score_part_one(round_tuple)
    return get_choice_score_part_one(round_tuple[1]) + get_outcome_score_part_one(round_tuple)
end


# Get the total score of the game (according to Part 1's rules)
def get_total_score_part_one(parsed_input)
    total_score = 0
    parsed_input.each do |round_tuple|
        total_score += get_round_score_part_one(round_tuple)
    end
    return total_score
end


# Get the score for my choice (according to Part 2's rules)
def get_choice_score_part_two(round_tuple)
    case round_tuple[0] # Opponent's choice
    when "A" # Rock
        case round_tuple[1] # Round outcome
        when "X" # Loss
            return SCISSORS_SCORE
        when "Y" # Draw
            return ROCK_SCORE
        when "Z" # Win
            return PAPER_SCORE
        end
    when "B" # Paper
        case round_tuple[1] # Round outcome
        when "X" # Loss
            return ROCK_SCORE
        when "Y" # Draw
            return PAPER_SCORE
        when "Z" # Win
            return SCISSORS_SCORE
        end
    when "C" # Scissors
        case round_tuple[1] # Round outcome
        when "X" # Loss
            return PAPER_SCORE
        when "Y" # Draw
            return SCISSORS_SCORE
        when "Z" # Win
            return ROCK_SCORE
        end
    end
end


# Get the outcome score of the round (according to Part 2's rules)
def get_outcome_score_part_two(outcome)
    case outcome
    when "X" # Loss
        return LOSS_SCORE
    when "Y" # Draw
        return DRAW_SCORE
    when "Z" # Win
        return WIN_SCORE
    end
end


# Get the score for the round (according to Part 2's rules)
def get_round_score_part_two(round_tuple)
    return get_choice_score_part_two(round_tuple) + get_outcome_score_part_two(round_tuple[1])
end


# Get the total score of the game (according to Part 2's rules)
def get_total_score_part_two(parsed_input)
    total_score = 0
    parsed_input.each do |round_tuple|
        total_score += get_round_score_part_two(round_tuple)
    end
    return total_score
end


# Do ALL the things!
if __FILE__ == $0
    puts "### Advent of Code 2022, Day 02 ###"
    puts "\n"

    parsed_input = get_parsed_input()

    puts "### Part 1 Solution ###"
    puts get_total_score_part_one(parsed_input)
    puts "\n"

    puts "### Part 2 Solution ###"
    puts get_total_score_part_two(parsed_input)
    puts "\n"
end
