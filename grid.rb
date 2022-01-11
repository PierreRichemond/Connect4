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
      current_row_for_chosen_column = @board_row_index[column_chosen_by_player]
      @grid[current_row_for_chosen_column][column_chosen_by_player] = player.player_number
      @board_row_index[column_chosen_by_player] -= 1
      player.win! if aligned?(column_chosen_by_player, current_row_for_chosen_column)
    end
  end

  def aligned?(column_chosen_by_player, current_row_for_chosen_column)

    return true if check_verticality(column_chosen_by_player, current_row_for_chosen_column) == 4
    return true if check_horizontallity(column_chosen_by_player, current_row_for_chosen_column) >= 4
    return true if check_diagonals(column_chosen_by_player, current_row_for_chosen_column) >= 4
    false
  end

  private

  def check_verticality(column_chosen_by_player, current_row_for_chosen_column) # in progress
    count = 1
    index_of_next_row_to_come = @board_row_index[column_chosen_by_player]
    chosen_location_value = @grid[current_row_for_chosen_column][column_chosen_by_player]

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

  def check_horizontallity(column_chosen_by_player, current_row_for_chosen_column) # working
    count = 1
    index_of_next_row_to_come = @board_row_index[column_chosen_by_player]
    chosen_location_value = @grid[current_row_for_chosen_column][column_chosen_by_player]

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

  def check_diagonals(column_chosen_by_player, current_row_for_chosen_column)
    count = diagonal_top_left(column_chosen_by_player, current_row_for_chosen_column)
    return count if count >= 4

    diagonal_top_right(column_chosen_by_player, current_row_for_chosen_column)
  end

  def diagonal_top_right(column_chosen_by_player, current_row_for_chosen_column)
    count = 1
    index_of_next_row_to_come = @board_row_index[column_chosen_by_player]
    chosen_location_value = @grid[current_row_for_chosen_column][column_chosen_by_player]
    # ----------------------------RIGHT AND UP--------------------------------------
    # check diagonal right up,  -1 UP        +1 RIGHT
    if !@grid[index_of_next_row_to_come].nil? && (column_chosen_by_player + 1) < 7
      count += 1 if chosen_location_value == @grid[index_of_next_row_to_come][column_chosen_by_player + 1]
      # check diagonal right up,  -2 UP        +2 RIGHT
      if !@grid[index_of_next_row_to_come - 1].nil? && (column_chosen_by_player + 2) < 7
        count += 1 if chosen_location_value == @grid[index_of_next_row_to_come - 1][column_chosen_by_player + 2]
        # check diagonal right up,  -3 UP        +3 RIGHT
        if !@grid[index_of_next_row_to_come - 2].nil? && (column_chosen_by_player + 3) < 7
          count += 1 if chosen_location_value == @grid[index_of_next_row_to_come - 2][column_chosen_by_player + 3]
        end
      end
    end
    # ----------------------------LEFT AND DOWN--------------------------------------
    # check diagonal right up,  +1 DOWN                -1 LEFT
    if !@grid[index_of_next_row_to_come + 2].nil? && !(column_chosen_by_player - 1).negative?
      count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 2][column_chosen_by_player - 1]
      # check diagonal right up,  +2 DOWN                -2 LEFT
      if !@grid[index_of_next_row_to_come + 3].nil? && !(column_chosen_by_player - 2).negative?
        count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 3][column_chosen_by_player - 2]
        # check diagonal right up,  +3 DOWN                -3 LEFT
        if !@grid[index_of_next_row_to_come + 4].nil? && !(column_chosen_by_player - 3).negative?
          count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 4][column_chosen_by_player - 3]
        end
      end
    end
    count
  end

  def diagonal_top_left(column_chosen_by_player, current_row_for_chosen_column)
    count = 1
    index_of_next_row_to_come = @board_row_index[column_chosen_by_player]
    chosen_location_value = @grid[current_row_for_chosen_column][column_chosen_by_player]
    # ----------------------------LEFT AND UP--------------------------------------
    # check diagonal left up, negative and nil  -1 UP        -1 LEFT
    if !@grid[index_of_next_row_to_come].nil? && !(column_chosen_by_player - 1).negative?
      count += 1 if chosen_location_value == @grid[index_of_next_row_to_come][column_chosen_by_player - 1]
      # check diagonal left up, negative and nil  -2 UP        -2 LEFT
      if !@grid[index_of_next_row_to_come - 1].nil? && !(column_chosen_by_player - 2).negative?
        count += 1 if chosen_location_value == @grid[index_of_next_row_to_come - 1][column_chosen_by_player - 2]
        # check diagonal left up, negative and nil  -3 UP        -3 LEFT
        if !@grid[index_of_next_row_to_come - 2].nil? && !(column_chosen_by_player - 3).negative?
          count += 1 if chosen_location_value == @grid[index_of_next_row_to_come - 2][column_chosen_by_player - 3]
        end
      end
    end
    # ----------------------------RIGHT AND DOWN--------------------------------------
    # check diagonal right up,  +1 DOWN                -1 LEFT
    if !@grid[index_of_next_row_to_come + 2].nil? && (column_chosen_by_player + 1) < 7
      count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 2][column_chosen_by_player + 1]
      # check diagonal right up,  +2 DOWN                -2 LEFT
      if !@grid[index_of_next_row_to_come + 3].nil? && (column_chosen_by_player + 2) < 7
        count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 3][column_chosen_by_player + 2]
        # check diagonal right up,  +3 DOWN                -3 LEFT
        if !@grid[index_of_next_row_to_come + 4].nil? && (column_chosen_by_player + 3) < 7
          count += 1 if chosen_location_value == @grid[index_of_next_row_to_come + 4][column_chosen_by_player + 3]
        end
      end
    end
    count
  end
end
