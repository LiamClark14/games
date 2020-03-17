class Board
    def initialize
        @board = [
            ["-", "-", "-", "-", "-", "-", "-"],
            ["-", "-", "-", "-", "-", "-", "-"],
            ["-", "-", "-", "-", "-", "-", "-"],
            ["-", "-", "-", "-", "-", "-", "-"],
            ["-", "-", "-", "-", "-", "-", "-"],
            ["-", "-", "-", "-", "-", "-", "-"],
            ["-", "-", "-", "-", "-", "-", "-"],
          ]
          @number_of_turns = 1
    end

    def check_winner
        i = 0 
        while i < @board.length
            j = 0
            while j < @board[i].length
                if i <=3
                  if @board[i][j] == "X" && @board[i+1][j] == "X" && @board[i+2][j] == "X" && @board[i+3][j] == "X"
                      return "The X's Win!"
                  end
                else
                  if @board[i][j] == "X" && @board[i-1][j] == "X" && @board[i-2][j] == "X" && @board[i-3][j] == "X"
                    return "The X's Win!"
                  end
                end
                if j <= 3
                  if @board[i][j] == "X" && @board[i][j+1] == "X" && @board[i][j+2] == "X" && @board[i][j+3] == "X"
                    return "The X's Win!"
                  end
                else
                  if @board[i][j] == "X" && @board[i][j-1] == "X" && @board[i][j-2] == "X" && @board[i][j-3] == "X"
                        return "The X's Win!"
                  end
                end
                if i <=3
                    if @board[i][j] == "O" && @board[i+1][j] == "O" && @board[i+2][j] == "O" && @board[i+3][j] == "O"
                        return "The O's Win!"
                    end
                  else
                    if @board[i][j] == "O" && @board[i-1][j] == "O" && @board[i-2][j] == "O" && @board[i-3][j] == "O"
                      return "The O's Win!"
                    end
                  end
                  if j <= 3
                    if @board[i][j] == "O" && @board[i][j+1] == "O" && @board[i][j+2] == "O" && @board[i][j+3] == "O"
                      return "The O's Win!"
                    end
                  else
                    if @board[i][j] == "O" && @board[i][j-1] == "O" && @board[i][j-2] == "O" && @board[i][j-3] == "O"
                          return "The O's Win!"
                    end
                  end
                  # Diagonals
                if i <= 3 && j <= 3
                    if @board[i][j] == "X" && @board[i+1][j+1] == "X" && @board[i+2][j+2] == "X" && @board[i+3][j+3] =="X"
                        return "The X's Win!"
                    end
                elsif i >= 3 && j >= 3
                    if @board[i][j] == "X" && @board[i-1][j-1] == "X" && @board[i-2][j-2] == "X" && @board[i-3][j-3] =="X"
                        return "The X's Win!"
                    end
                elsif i <= 3 && j >= 3
                    if @board[i][j] == "X" && @board[i+1][j-1] == "X" && @board[i+2][j-2] == "X" && @board[i+3][j-3] =="X"
                        return "The X's Win!"
                    end
                elsif i >= 3 && j <= 3
                    if @board[i][j] == "X" && @board[i-1][j+1] == "X" && @board[i-2][j+2] == "X" && @board[i-3][j+3] =="X"
                        return "The X's Win!"
                    end
                end
                if i <= 3 && j <= 3
                    if @board[i][j] == "O" && @board[i+1][j+1] == "O" && @board[i+2][j+2] == "O" && @board[i+3][j+3] =="O"
                        return "The O's Win!"
                    end
                elsif i >= 3 && j >= 3
                    if @board[i][j] == "O" && @board[i-1][j-1] == "O" && @board[i-2][j-2] == "O" && @board[i-3][j-3] =="O"
                        return "The O's Win!"
                    end
                elsif i <= 3 && j >= 3
                    if @board[i][j] == "O" && @board[i+1][j-1] == "O" && @board[i+2][j-2] == "O" && @board[i+3][j-3] =="O"
                        return "The O's Win!"
                    end
                elsif i >= 3 && j <= 3
                    if @board[i][j] == "O" && @board[i-1][j+1] == "O" && @board[i-2][j+2] == "O" && @board[i-3][j+3] =="O"
                        return "The O's Win!"
                    end
                end

                j += 1
            end
            i += 1
        end
        return "continue"
    end
            

    def show_board
        i = 0
        while i < @board.length
            row = @board[i].join(" ")
            puts row
            i += 1
        end
    end

    def update_board(num)
        if num > 6 || num < -1
            puts "Operation does not compute. Number must be between 0-6. Try again:"
            number = gets.chomp.to_i
            update_board(number)
        end
        i = @board.length - 1
        
        while i >= 0
            if @board[i][num] == "-" && @number_of_turns % 2 == 1
                @board[i][num] = "X"
                @number_of_turns += 1
                break
            elsif @board[i][num] == "-" && @number_of_turns % 2 == 0
                @board[i][num] = "O"
                @number_of_turns += 1
                break
            else
                i -= 1
            end
        end
    end

end

puts "type the word board"
response = gets.chomp
while response != "quit"
    if response.downcase == "board"
        board = Board.new
        board.show_board
    end
    puts "Choose a column to make a move (0-6), or type -1 to quit"
    number = gets.chomp.to_i
    while number != -1
        board.update_board(number)
        board.show_board
        puts board.check_winner
        puts "Choose another column to move again (0-6), or type -1 to quit"
        number = gets.chomp.to_i
    end
    puts "Thanks for playing! Enter 'board' to play again or 'quit' to quit"
    response = gets.chomp
end

