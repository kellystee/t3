module T3
  class GameRules
    attr_accessor :board

    STARTING_SPACE = 0

    def initialize(board)
      @board = board
    end

    def game_over?
      board_full? || win_game?
    end

    def board_full?
      @board.spaces.select { |space| space =~ /\d/ } == []
    end

    def win_game?
      winning_gamepiece != nil
    end

    def winning_gamepiece
      board_partitions = [row_contents, column_contents, left_diagonal_contents, right_diagonal_contents]
      winning_gamepiece = []

      board_partitions.each do |board_partition|
        board_partition.each do |win_group|
          if win_group.uniq.length == 1 && win_group.count == @board.size
            winning_gamepiece << win_group.first
          end
        end
      end

      winning_gamepiece.join[0]
    end

    def row_contents
      @board.spaces.each_slice(@board.size).to_a
    end

    def column_contents
      row_contents.transpose
    end

    def left_diagonal_contents
      [ range.collect{ |i| row_contents[i][i] } ]
    end

    def right_diagonal_contents
      reversed_row_contents = row_contents.map { |row| row.reverse }
      [ range.collect { |i| reversed_row_contents[i][i] } ]
    end

    private

    def range
      range_start = STARTING_SPACE
      range_end = @board.size - 1
      range = range_start..range_end
    end

  end
end
