require 'pry'


class Board
    attr_accessor :cells
    
    def initialize
        @cells = [" "] * 9
    end

    def reset!
        @cells = [" "] * 9
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "    
    end

    def position(num)
        cells[num.to_i - 1]
    end

    def full?
        turn_count == 9
    end

    def turn_count
        (cells - [" "]).length
    end

    def taken?(num)
        position(num) != " "
    end

    def valid_move?(num)
        (1..9).include?(num.to_i) && !taken?(num)
    end

    def update(num, player)
        cells[num.to_i - 1] = player.token
    end
end