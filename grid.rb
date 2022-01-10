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

  def place_disk(player, column_chosen_by_player)
    if @board_row_index[column_chosen_by_player] == - 1
      puts 'column_chosen_by_player Full, choose another one'
    else
      @current_row_for_chosen_column = @board_row_index[column_chosen_by_player]
      @grid[@current_row_for_chosen_column][column_chosen_by_player] = player.player_number
      @board_row_index[column_chosen_by_player] -= 1
      player.win! if aligned?(column_chosen_by_player)
    end
  end

  def aligned?(column_chosen_by_player)
    return true if check_verticality(column_chosen_by_player) == 4
    return true if check_horizontallity(column_chosen_by_player) >= 4
    # return true if check_diagonals(column_chosen_by_player) >= 4
  end

  private

  def check_verticality(column_chosen_by_player) # in progress
    count = 1
    index_of_next_row_to_come = @board_row_index[column_chosen_by_player]
    chosen_location_value = @grid[@current_row_for_chosen_column][column_chosen_by_player]

    if !@grid[index_of_next_row_to_come + 2].nil?
      count += 1 if @grid[index_of_next_row_to_come + 2][column_chosen_by_player] == chosen_location_value
    end
    if !@grid[index_of_next_row_to_come + 3].nil?
      count += 1 if @grid[index_of_next_row_to_come + 3][column_chosen_by_player] == chosen_location_value
    end
    if !@grid[index_of_next_row_to_come + 4].nil?
      count += 1 if @grid[index_of_next_row_to_come + 4][column_chosen_by_player] == chosen_location_value
    end
    count
  end

  def check_horizontallity(column_chosen_by_player) # working
    count = 1
    index_of_next_row_to_come = @board_row_index[column_chosen_by_player]
    chosen_location_value = @grid[@current_row_for_chosen_column][column_chosen_by_player]

    if chosen_location_value == @grid[index_of_next_row_to_come + 1][column_chosen_by_player + 1]
      count += 1
      if chosen_location_value == @grid[index_of_next_row_to_come + 1][column_chosen_by_player + 2]
        count += 1
        count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 1][column_chosen_by_player + 3]
      end
    end
    if chosen_location_value == @grid[index_of_next_row_to_come + 1][column_chosen_by_player - 1]
      return count if (column_chosen_by_player - 1).negative?
      count += 1
      if chosen_location_value == @grid[index_of_next_row_to_come + 1][column_chosen_by_player - 2]
        return count if (column_chosen_by_player - 2).negative?
        count += 1
        if chosen_location_value == @grid[index_of_next_row_to_come + 1][column_chosen_by_player - 3]
          return count if (column_chosen_by_player - 3).negative?
          count += 1
        end
      end
    end
    count
  end

  def check_diagonals(player, column_chosen_by_player) # in progress
  end
end
