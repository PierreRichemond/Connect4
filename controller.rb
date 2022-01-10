require_relative 'view.rb'
class Controller
  attr_reader :player, :opponent
  def initialize(attributes = {})
    @player1 = attributes[:p1]
    @player2 = attributes[:p2]
    @grid = attributes[:grid]
    @view = View.new
  end

  def ask_location_number_to_place_disk
    location_number = @view.ask_location_number
    if location_number.nil? || location_number.to_i.negative? || location_number.to_i > 7
      @view.out_of_band
      ask_location_number_to_place_disk
    end
    location_number.to_i - 1
  end

  def place_disk
    location_number = ask_location_number_to_place_disk
    players = [@player1, @player2]
    @grid.place_disk(@player, location_number)
    @view.show_grid(@grid, players)
  end

  def switch_players
    if @player == @player1
      @player = @player2
      @opponent = @player1
    else
      @player = @player1
      @opponent = @player2
    end
  end

  def player_order
    @player = [@player1, @player2].sample # will alternate later each turn with switch_player method below
    @player.player_number = 1
    @player == @player1 ? @opponent = @player2 : @opponent = @player1
    @opponent.player_number = 2
  end

  def win?
    @player.win
  end
end
