class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        self.board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each do |a, b, c|
            if (self.board.cells[a] == self.board.cells[b]) && (self.board.cells[b] == self.board.cells[c]) && self.board.taken?(a+1)
                return [a, b, c]
            end
        end
        nil
    end

    def draw?
        self.board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        won? ? self.board.cells[won?[1]] : nil
    end

    def turn
        num = current_player.move(self.board)
        self.board.valid_move?(num) ? self.board.update(num, current_player) : turn
    end
        
end