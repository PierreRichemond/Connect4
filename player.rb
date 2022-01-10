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
