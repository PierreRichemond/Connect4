require_relative "controller.rb"
require_relative "model.rb"
class App
  def initialize
    @grid = Grid.new
    @player_1 = Player.new(grid: @grid)
    @player_2 = Player.new(grid: @grid)
    @controller = Controller.new(p1: @player_1, p2: @player_2, grid: @grid)
    @running = true
    run
  end

  def run
    welcome_message
    kick_start
  end

  def welcome_message
    puts "Welcome Connect 4"
    puts "This is a 2 players game."
    puts "Place your disks in turns"
    puts "The first player to have 4 disks aligned wins."
    puts "Good luck & Have fun."
    puts "           --           "
    puts "Enter the name of a player"
    @player_1.name = gets.chomp
    puts "Enter the name of a second player"
    @player_2.name = gets.chomp
    @controller.player_order
  end

  def kick_start
    while @running
      puts "Your turn #{@controller.player.name}"
      display_tasks
      action = gets.chomp.to_i
      route_action(action)
      if action == 1
        if @controller.player.win?
          puts ''
           puts "CONGRATULATION #{@controller.player.name}, YOU WIN !"
          display_options
          choice = gets.chomp.to_i
          play_again(choice) # or quit
        end
        @controller.switch_players
      end
    end
  end

  private

  def stop
    @running = false
  end

  def route_action(action)
    case action
    when 1 then @controller.place_disk
    when 8 then stop
    else
      puts "Please press 1 or 8"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - place a disk"
    puts "8 - Stop and exit the program"
  end

  def play_again(action)
    case action
      when 1 then kick_start
      when 8 then stop
    else
      puts "Please press 1 or 8"
    end
  end

  def display_options
    puts ""
    puts "What do you want to do next?"
    puts "1 - Play again"
    puts "8 - Stop and exit the program"
  end
end
App.new.run
