#!/usr/bin/env ruby

# Advent of Code 2022, Day 02
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


# Get the score corresponding to choosing Rock
def get_rock_score
    return 1
end


# Get the score corresponding to choosing Paper
def get_paper_score
    return 2
end


# Get the score corresponding to choosing Scissors
def get_scissors_score
    return 3
end


# Get the score corresponding to a Loss
def get_loss_score
    return 0
end


# Get the score corresponding to a Draw
def get_draw_score
    return 3
end


# Get the score corresponding to a Win
def get_win_score
    return 6
end


# Get the score for my choice (according to Part One's rules)
def get_choice_score_part_one(choice)
    case choice
    when "X" # Rock
        return get_rock_score
    when "Y" # Paper
        return get_paper_score
    when "Z" # Scissors
        return get_scissors_score
    end
end


# Get the outcome score of the round (according to Part One's rules)
def get_outcome_score_part_one(round_tuple)
    case round_tuple[0] # Opponent's choice
    when "A" # Rock
        case round_tuple[1] # My choice
        when "X" # Rock
            return get_draw_score
        when "Y" # Paper
            return get_win_score
        when "Z" # Scissors
            return get_loss_score
        end
    when "B" # Paper
        case round_tuple[1] # My choice
        when "X" # Rock
            return get_loss_score
        when "Y" # Paper
            return get_draw_score
        when "Z" # Scissors
            return get_win_score
        end
    when "C" # Scissors
        case round_tuple[1] # My choice
        when "X" # Rock
            return get_win_score
        when "Y" # Paper
            return get_loss_score
        when "Z" # Scissors
            return get_draw_score
        end
    end
end


# Get the score for the round (according to Part One's rules)
def get_round_score_part_one(round_tuple)
    return get_choice_score_part_one(round_tuple[1]) + get_outcome_score_part_one(round_tuple)
end


# Get the total score of the game (according to Part One's rules)
def get_total_score_part_one(parsed_input)
    total_score = 0
    parsed_input.each do |round_tuple|
        total_score += get_round_score_part_one(round_tuple)
    end
    return total_score
end


# Get the score for my choice (according to Part Two's rules)
def get_choice_score_part_two(round_tuple)
    case round_tuple[0] # Opponent's choice
    when "A" # Rock
        case round_tuple[1] # Round outcome
        when "X" # Loss
            return get_scissors_score
        when "Y" # Draw
            return get_rock_score
        when "Z" # Win
            return get_paper_score
        end
    when "B" # Paper
        case round_tuple[1] # Round outcome
        when "X" # Loss
            return get_rock_score
        when "Y" # Draw
            return get_paper_score
        when "Z" # Win
            return get_scissors_score
        end
    when "C" # Scissors
        case round_tuple[1] # Round outcome
        when "X" # Loss
            return get_paper_score
        when "Y" # Draw
            return get_scissors_score
        when "Z" # Win
            return get_rock_score
        end
    end
end


# Get the outcome score of the round (according to Part Two's rules)
def get_outcome_score_part_two(outcome)
    case outcome
    when "X" # Loss
        return get_loss_score
    when "Y" # Draw
        return get_draw_score
    when "Z" # Win
        return get_win_score
    end
end


# Get the score for the round (according to Part Two's rules)
def get_round_score_part_two(round_tuple)
    return get_choice_score_part_two(round_tuple) + get_outcome_score_part_two(round_tuple[1])
end


# Get the total score of the game (according to Part Two's rules)
def get_total_score_part_two(parsed_input)
    total_score = 0
    parsed_input.each do |round_tuple|
        total_score += get_round_score_part_two(round_tuple)
    end
    return total_score
end


# Do ALL the things!
if __FILE__ == $0
    parsed_input = get_parsed_input()

    puts "### Part One Solution ###"
    puts get_total_score_part_one(parsed_input)

    puts "\n"

    puts "### Part Two Solution ###"
    puts get_total_score_part_two(parsed_input)
end
