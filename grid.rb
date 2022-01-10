require "pry"

class Grid
  attr_reader :grid

  def initialize
    @board_row_index = [5, 5, 5, 5, 5, 5, 5]
    @grid = [
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0]
            ]
  end

  def place_disk(player, column)
    if @board_row_index[column] == - 1
      puts 'Column Full, choose another one'
    else
      @col = @board_row_index[column]
      @grid[@col][column] = player.player_number
      @board_row_index[column] -= 1
      player.win! if aligned?
    end
  end

  def aligned?(column)
    true if check_verticality(column) == 4
    true if check_horizontallity(column) >= 4
    # true if check_diagonals(column) >= 4
  end

  private

  def check_verticality(column) # in progress
    count = 1
    # column = column
    # @col = @board_row_index[column]
    # @board_row_index = [5, 5, 5, 5, 5, 5, 5]
    # @grid = [
    #           [0, 0, 0, 0, 0, 0, 0],
    #           [0, 0, 0, 0, 0, 0, 0],
    #           [0, 0, 0, 0, 0, 0, 0],
    #           [0, 0, 0, 0, 0, 0, 0],
    #           [0, 0, 0, 0, 0, 0, 0],
    #           [0, 0, 0, 0, 0, 0, 0]
    #         ]
    if !@grid[@board_row_index[column] + 1].nil?
      count += 1 if @grid[@board_row_index[column] + 1]
    end
      # check the column and col
      # check the previous columns
    count
  end

  def check_horizontallity(column) # working
    count = 1
    @grid.each do |row|
      if @grid[@col][column] == row[column + 1]
        count += 1
        if @grid[@col][column] == row[column + 2]
          count += 1
          count += 1 if @grid[@col][column] == row[column + 3]
        end
      end
      if @grid[@col][column] == row[column - 1]
        return count if (column - 1).negative?
        count += 1
        if @grid[@col][column] == row[column - 2]
          return count if (column - 2).negative?
          count += 1
          if @grid[@col][column] == row[column - 3]
              return count if (column - 3).negative?
              count += 1
          end
        end
      end
    end
    count
  end

  def check_diagonals(player, column) # in progress
  end
end
