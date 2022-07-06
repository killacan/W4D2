require_relative "piece"

module Steppable
    
    
    def moves
        moves= []

        move_diffs.each do |ms|
            if valid_pos?(ms.first, ms.last) && self[ms.first, ms.last].is_a?(Null)
            
                moves << [ms.first, ms.last]
            
            end
            moves
        end
    end

    private
    def move_diffs
        raise NotImplementedError
    end
end

class Knight < Piece
    #movement [2,1] 
    def move_diffs
        moves_knight = [[2,1],[1,2],[-2,1],[1,-2],[-1,2],[-1,-2],[-2,-1],[2,-1]]
    end

    def symbol
        "Kn1".colorize(:white)
        "Kn2".colorize(:black)
    end
end

class King < Piece
    #one space, any direction
    def move_diffs
        moves_king = [[1,1],[1,0],[0,1],[0,-1],[-1,0],[-1,-1],[1,-1],[-1,1]]
    end

    def symbol
        "K1".colorize(:white)
        "K2".colorize(:black)
    end
end