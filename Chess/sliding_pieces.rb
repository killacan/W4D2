require_relative "piece"

module Slidable

    def horizonal_dirs
        @horizontal = []
        possible_moves_horizontal = []
        row = pos.first
        col = pos.last
        current_pos[row][col]
        horizontal_pos = [[1,0], [-1,0],[0,1],[0,-1]]
        

        (-7 .. 7).each do |i|
            (-7 .. 7).each do |j|
                new_row = i + row
                new_col = j + cal
                @horizontal << [new_row, new_col]
            end
        end


    end

    def diagonal_dirs
        @diagonal = []
        possible_moves_diagonal = []
        diagonal_pos = [[1,1], [-1,1],[1,-1],[-1,-1]]
        row = pos.first
        col = pos.last
        current_pos[row][col]

        vertical_pos.each do |point|
            move_row, move_col = point.first, point.last
            new_row = move_row + row
            new_col = move_cal + cal
            @vertical << [new_row, new_col]
            possible_moves_vertical << @vertical
        end
    end

    def moves
        #moves has to return all possible moves. 
    end

    private
    def move_dirs

    end

    def grow_unblocked_moves_in_dir(dx, dy)

    end
end

class Bishop < Piece

    #movement: diagonal
    def move(name, pos)

    end

end

class Rook < Piece

    #movement: horizonal and vertical
    def move(name, pos)

    end
end

class Queen < Piece

    # movement: combination of Rook and Bishop
    def move(name, pos)

    end
end