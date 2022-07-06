class Piece

    def initialize(pos, name)
        @current_pos = pos
        @name = name
    end

    def move(name, pos)
        puts "#{name} moves to #{pos}"
        #"Rook moves to [3,3]"
    end
end

#going to have to impliment a distinct symbol for each piece type. 