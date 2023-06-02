class TicTacToe
    # constructor to initialize game
    def initialize
        @board = Array.new(3) {Array.new(3, " ") }
        @current_player = "X"
    end

    #function to display the game board
    def display_board
        puts "---------"
        @board.each { |row| puts row.join(" | ") }
        puts "---------"
    end

    #make a move on the board
    def make_move(row, col)
        if row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == " "
            @board[row][col] = @current_player
            return true
        end
        false
    end

    #function to switch player
    def switch_player
        @current_player = (@current_player == "X") ? "O" : "X"
    end

    #function to check for a win
    def check_win
        win_conditions = [
            [@board[0][0], @board[0][1], @board[0][2]], #rows
            [@board[1][0], @board[1][1], @board[1][2]],
            [@board[2][0], @board[2][1], @board[2][2]],
            [@board[0][0], @board[1][0], @board[2][0]], #columns
            [@board[0][1], @board[1][1], @board[2][1]],
            [@board[0][2], @board[1][2], @board[2][2]],
            [@board[0][0], @board[1][1], @board[2][2]], #diagonals
            [@board[0][2], @board[1][1], @board[2][0]],
        ]

        win_conditions.each do |condition|
            return true if condition.all? { |cell| cell == @current_player }
        end
        false
    end

    #check for a tie (no empty spaces left)
    def check_tie
        @board.flatten.none?(" ")
    end

    #function for game logic
    def play_game
        loop do
            system("clear")
            display_board
            
            puts "Player #{@current_player}, enter your move (row [0-2], column [0-2]):"
            move = gets.chomp.split.map(&:to_i)

            row, col = move
            if make_move(row, col)
                if check_win
                    system("clear")
                    display_board
                    puts "Player #{@current_player} wins!"
                    break
                elsif check_tie
                    system("clear")
                    display_board
                    puts "It's a tie!"
                    break
                else
                    switch_player
                end
            else
                puts "Invalid move. Try again."
            end
        end
    end
end

game = TicTacToe.new
game.play_game