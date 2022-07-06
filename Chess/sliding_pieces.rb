require_relative "piece"

module Slidable

    def horizonal_dirs
        horizontal_pos = [[1,0],[-1,0],[0,1],[0,-1]]

    end

    def diagonal_dirs
        diagonal_pos = [[1,1],[-1,1],[1,-1],[-1,-1]]

    end

    def moves
        #moves has to return all possible moves. 

        pos_moves = []
        move_dirs.each do |dx, dy|
            pos_moves.concat(grow_unblocked_moves_in_dir(dx,dy))
        end
        pos_moves
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # check if it is on the board, if there is a piece in the way, if it is an
        # enemy piece. 
        # check from the start position outwards. 
        # still_legal = true
        moves= []
        current_x, current_y = self.current_pos

        while valid_pos?(dx, dy) && self[dx,dy].is_a?(Null)
            # if previous spot has an enemy, stop, if less than start pos, dont check. 
            if self.color != self.board[current_x][current_y]
                moves << [current_x, current_y]
                break
            end

            current_x += dx
            current_y += dy
            moves << [current_x, current_y]
        end
        moves
    end
end

class Bishop < Piece
include Slidable
    #movement: diagonal
    def move_dirs
        diagonal_dirs
    end

    def symbol
        "B1".colorize(:white)
        "B2".colorize(:black)
    end
end

class Rook < Piece
include Slidable
    #movement: horizonal

    def move_dirs
        horizonal_dirs
        end
    end 

    def symbol
        "R1".colorize(:white)
        "R2".colorize(:black)
    end
end

class Queen < Piece
include Slidable
    # movement: combination of Rook and Bishop
    def move_dirs
        diagonal_dirs + horizonal_dirs
    end

    def symbol
        "Q1".colorize(:white)
        "Q2".colorize(:black)
    end
end