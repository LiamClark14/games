def board
    @a1 = " "
    @a2 = " "
    @a3 = " "
    @b1 = " "
    @b2 = " "
    @b3 = " "
    @c1 = " "
    @c2 = " "
    @c3 = " "
    @turn_number = 0
    @last_turn = ""
end

@squares = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]


def win_combinations
    [[@a1, @a2, @a3], [@b1, @b2, @b3], [@c1, @c2, @c3], [@a1, @b2, @c3], [@a1, @b1, @c1], [@a2, @b2, @c2], [@a3, @b3, @c3], [@c1, @b2, @a3]]
end

def display
    puts
    puts "   1   2   3"
    puts "A  #{@a1} | #{@a2} | #{@a3} "
    puts "  ---|---|---"
    puts "B  #{@b1} | #{@b2} | #{@b3} "
    puts "  ---|---|---"
    puts "C  #{@c1} | #{@c2} | #{@c3} "
    puts
    check_winner

end

def check_if_valid(square_validity)
    if square_validity == " "
        true
    else
        puts "This square is taken, try again"
    end
end

def winning_move
    if @a1 == "X" && @a2 == "X"
        return "a3"
    elsif @a1 == "X" && @b1 == "X"
        return "c1"
    elsif @a1 == "X" && @b2 == "X"
        return "c3"
    elsif @a2 == "X" && @b2 == "X"
        return "c2"
    elsif @a2 == "X" && @a3 == "X"
        return "a1"
    elsif @a3 == "X" && @b3 == "X"
        return "c3"
    elsif @a3 == "X" && @b2 == "X"
        return "c1"
    elsif @b1 == "X" && @c1 == "X"
        return "a1"
    elsif @b1 == "X" && @b2 == "X"
        return "b3"
    elsif @c1 == "X" && @b2 == "X"
        return "a3"
    elsif @c1 == "X" && @c2 == "X"
        return "c3"
    elsif @c3 == "X" && @c2 == "X"
        return "c1"
    elsif @b2 == "X" && @c2 == "X"
        return "a2"
    elsif @b2 == "X" && @c3 == "X"
        return "a1"
    elsif @b3 == "X" && @b2 == "X"
        return "b1"
    elsif @c3 == "X" && @b3 == "X"
        return "a3"
    else
        return "none"
    end
        

def turn
    choice_hash = {"a1" => @a1, "a2" => @a2, "a3" => @a3, "b1" => @b1, "b2" => @b2, "b3" => @b3, "c1" => @c1, "c2" => @c2, "c3" => @c3}
    puts "Select a square:"
    choice = gets.chomp.downcase
    @last_turn = choice
    choice_hash.each do | move, square|
        if choice == move
            if check_if_valid(square)
                square.sub!(" ", "X")
                @squares.delete(choice_hash["#{choice}"])
            end
        elsif choice == "quit"
            exit
        end
    end
    @turn_number += 1
    check_winner
end

def other_turn
    choice_hash = {"a1" => @a1, "a2" => @a2, "a3" => @a3, "b1" => @b1, "b2" => @b2, "b3" => @b3, "c1" => @c1, "c2" => @c2, "c3" => @c3}
        if @last_turn == "b2"
            if check_if_valid(@a1)
                @a1.sub!(" ", "O")
                @a1.delete(choice_hash["a1"])
                
            end
        elsif winning_move != "none" && check_if_valid(winning_move)
            choice_hash[winning_move].sub(" ", "O")
        else
            if check_if_valid(@b2)
                @b2.sub!(" ", "O")
                @b2.delete(choice_hash["a1"])
                
            end
        end
    @turn_number += 1
    check_winner
end

def check_winner
    win_combinations.each do |combos|
        if combos[0] == "O" && combos[1] == "O" && combos[2] == "0"
            puts "The O's Win!"
            exit
        elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
            puts "The X's Win!"
            exit
        elsif @turn_number == 9
            puts "It's a cat's game!"
            exit
        end
    end
end

def start_game
    puts "Welcome to tic-tac-toe!"
    puts "To make a move, enter the location of the desired square."
    puts "To exit enter 'quit' at any time"
end

def run_game
    start_game
    board
    while true
        display
        turn
        other_turn
    end
end

run_game
