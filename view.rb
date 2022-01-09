class View
  def ask_location_number
    puts 'pick a number between 1 and 7'
    gets.chomp
  end

  def out_of_band
    puts 'it is an improper location'
  end

  def show_grid(grid, players)
    arr = [
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ']
    ]
    grid.grid.each_with_index do |row, row_index|
      row.each_with_index do |number, col_index|
        arr[row_index][col_index] = 'x' if number == 1
        arr[row_index][col_index] = 'o' if number == 2
      end
    end
    puts "
    Connect 4

-------- 1 2 3 4 5 6 7 ---------
        |#{arr[0][0]}|#{arr[0][1]}|#{arr[0][2]}|#{arr[0][3]}|#{arr[0][4]}|#{arr[0][5]}|#{arr[0][6]}|
        |#{arr[1][0]}|#{arr[1][1]}|#{arr[1][2]}|#{arr[1][3]}|#{arr[1][4]}|#{arr[1][5]}|#{arr[1][6]}|
        |#{arr[2][0]}|#{arr[2][1]}|#{arr[2][2]}|#{arr[2][3]}|#{arr[2][4]}|#{arr[2][5]}|#{arr[2][6]}|
        |#{arr[3][0]}|#{arr[3][1]}|#{arr[3][2]}|#{arr[3][3]}|#{arr[3][4]}|#{arr[3][5]}|#{arr[3][6]}|
        |#{arr[4][0]}|#{arr[4][1]}|#{arr[4][2]}|#{arr[4][3]}|#{arr[4][4]}|#{arr[4][5]}|#{arr[4][6]}|
        |#{arr[5][0]}|#{arr[5][1]}|#{arr[5][2]}|#{arr[5][3]}|#{arr[5][4]}|#{arr[5][5]}|#{arr[5][6]}|
--------------------------------
        "
        puts details(players)
  end

  def details(players)
    players[0].player_number == 1 ? "x belongs to #{players[0].name}, o belongs to #{players[1].name}" : "x belongs to #{players[1].name}, o belongs to #{players[0].name}"
  end
end
