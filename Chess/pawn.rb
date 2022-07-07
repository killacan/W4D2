require_relative "piece"

class Pawn < Piece

    def symbol
        "P1".colorize(:white)
        "P2".colorize(:black)
    end

    def moves
        #returns all the possible moves. Calls forward_steps, side_attacks, and forward_dir
       side_attacks
       forward_dir
       forward_steps
    end

    private 
    def at_start_row?
        #check for start row. 
        if @current_pos.first == 1 || @current_pos.first == 6
            true
        else
            false
        end
    end

    def forward_dir 
        #retuns 1 or -1
        # determines if it moves 1 or -1 based on color.
        if self.color == black
            -1
        else
            1
        end 
    end

    def forward_steps
        #handle starting row logic
        pos_moves = []
        if at_start_row?
            pos_moves << [0, 2] << [0, 1]
        else
            pos_moves << [0, 1]
        end
        
        pos_moves
    end

    def side_attacks
        # if an an enemy is adjacent, can take spot. 
        row, col = @current_pos.first, @current_pos.last
        if self.color != self.board[row + 1][col + 1] && self.color != self.board[row - 1][col + 1]
            moves << [row + 1, col + 1] << [row - 1, col + 1]
        end

        if self.color != self.board[row - 1][col - 1] && self.color != self.board[row + 1][col - 1]
            moves << [row - 1, col - 1] << [row + 1, col - 1]
        end
        moves
    end
end