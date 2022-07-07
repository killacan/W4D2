require_relative  "piece"
require_relative "null_pieces"
require_relative "sliding_pieces"
require_relative "stepping_pieces"
require_relative "pawn"
require "byebug"

#make a new to_s method, so that we dont print every detail. 

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def builder
        setup_rows = [0,7]
        pawn_white = 1
        pawn_black = 6

        # rows[0,0] = Rook.new([0,0], "white", @rows)


        @rows.each.with_index do |array, idx| 
            # if setup_rows.include?(idx)
            #     array.map!.with_index do |ele, idx2| 
            #         Piece.new([idx, idx2], @rows)
            #     end
            if pawn_white == idx
                array.map!.with_index do |ele, idx2|
                    Pawn.new([idx, idx2], "white", @rows)
                end
            
            elsif pawn_black == idx
                array.map!.with_index do |ele, idx2|
                    Pawn.new([idx, idx2], "black", @rows)
                end
            else
                array.map!.with_index do |ele, idx2| 
                    Null.instance
                end
            end
        end
    end

    def render
        @rows.each do |arr|
            puts arr
        end
    end
    
    def [](pos)
        row, col = pos.first, pos.last

        rows[row][col]
    end

    def []=(pos, val)
        row, col = pos.first, pos.last

        rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # row_start, col_start = start_pos.first, start_pos.last
        # row_end, col_end = end_pos.first, end_pos.last

        #eventually we are going to have to check if pos is valid. 
        # we are also going to to have to check if piece is at start. 
        if valid_pos?(start_pos) && valid_pos?(end_pos)
            # debugger
            self[end_pos] = self[start_pos]
            self[start_pos] = Null.instance
        end
    end

    def valid_pos?(pos)
        row, col = pos.first, pos.last

        if row.between?(0, 7) && col.between?(0, 7) 
            true
        else
            false
        end
    end
end

b = Board.new
b.builder
# p b
# p b.[]([2,2]) 
p b[[1,2]]
p b.move_piece([1,2], [3,3])
p b[[1,2]]
p b[[3,3]]