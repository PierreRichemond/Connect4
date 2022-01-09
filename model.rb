require "pry"

class Grid
  attr_reader :grid

  def initialize
    @times = [5, 5, 5, 5, 5, 5, 5]
    @grid = [
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0],
              [0, 0, 0, 0, 0, 0, 0]
            ]
  end

  def place_disk(player, number)
    if @times[number] == - 1
      puts 'Column Full, choose another one'
    else
      @player = player
      @number = number
      @spot = @times[@number]
      @grid[@spot][@number] = player.player_number
      @times[number] -= 1
      player.win! if aligned?
    end
  end

  def aligned?
    true if check_verticality >= 4
    true if check_horizontallity >= 4
    # true if check_diagonals >= 4
  end

   private

  def check_verticality # in progress
    count = 1
    @grid.each_with_index do |row, index|
      if @player.player_number == @grid[index + 1][@number]
        count += 1
        if @player.player_number == @grid[index + 2][@number]
          count += 1
          count += 1 if @player.player_number == @grid[index + 3][@number]
        end
      end
    end
    count
  end

  def check_horizontallity # working
    count = 1
    @grid.each do |row|
      if @grid[@spot][@number] == row[@number + 1]
        count += 1
        if @grid[@spot][@number] == row[@number + 2]
          count += 1
          count += 1 if @grid[@spot][@number] == row[@number + 3]
        end
      end
      if @grid[@spot][@number] == row[@number - 1]
        return count if (@number - 1).negative?
        count += 1
        if @grid[@spot][@number] == row[@number - 2]
          return count if (@number - 2).negative?
          count += 1
          if @grid[@spot][@number] == row[@number - 3]
              return count if (@number - 3).negative?
              count += 1
          end
        end
      end
    end
    count
  end

  def check_diagonals # in progress
  end
end

class Player
  attr_accessor :name, :player_number
  attr_reader :disks_location, :grid

  def initialize(attributes = {})
    @name = attributes[:name]
    @player_number = attributes[:player_number]
    @grid = attributes[:grid]
    @win = false
    @disks_location = attributes[:disks_location]
    @disks_location = nil
  end

  def win!
    @win = true
  end

  def win?
    @win
  end
end
