require_relative "piece"
require "singleton"

class Null < Piece
    include Singleton

    def initialize

    end
end