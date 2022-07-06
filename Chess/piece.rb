class Piece
    attr_reader :color
    attr_accessor :current_pos
    def initialize(pos, color, board)
        @current_pos = pos
        @color = color
        @board = board
    end

    def to_s

    end

    def empty?

    end

    def valid_moves

    end

    def pos=(val) 

    end

    def Symbol

    end

    private
    def move_into_check?(end_pos) 

    end
end

#going to have to impliment a distinct symbol for each piece type. 