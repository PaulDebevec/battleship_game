require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'
# @computer = Computer.new
# @computer_board = Board.new
# @player_board = Board.new
# @cruiser = Ship.new("Cruiser", 3)
# @computer_cruiser = Ship.new("Cruiser", 3)
# @submarine = Ship.new("Submarine", 2)
# @computer_submarine = Ship.new("Submarine", 2)
# @user_input = gets.chomp

def startup
  main_menu
end

  def main_menu
    puts "Welcome to BATTLESHIP"
    user_input = ""
    while user_input.downcase != "q"
      puts "Enter p to play. Enter q to quit."
      user_input = gets.chomp
      if user_input.downcase == "p"
        start_game
      elsif user_input.downcase == "q"
        puts "Go git gud"
      else
        puts "That's not what we asked for"
      end
    end
  end

  def start_game
    puts "=============COMPUTER BOARD============="
    computer_board = Board.new
    computer = Computer.new(computer_board)
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)
    computer.generate_placement(computer_cruiser)
    computer.generate_placement(computer_submarine)
    puts computer.board.render

    puts "=============PLAYER BOARD============="
    puts "*Computer*: I have laid out my ships on the board."
    player_board = Board.new
    puts player_board.render
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)
    puts "*Computer*: Now enter the coordinates to place your #{player_cruiser.name}"

    while true
      player_input = gets.chomp.upcase.split(" ")

      if player_board.valid_placement?(player_cruiser, player_input)
        break
      else
        puts "Invalid placement"
      end
    end

    place_ship = player_board.place(player_cruiser, player_input)

    puts "=============COMPUTER BOARD============="
    puts computer.board.render
    puts "=============PLAYER BOARD============="
    puts player_board.render(true)

    puts "*Computer*: Now, place your #{player_submarine.name}"
    player_input = gets.chomp.upcase.split(" ")
    place_ship = player_board.place(player_submarine, player_input)

    puts "=============COMPUTER BOARD============="
    puts computer.board.render
    puts "=============PLAYER BOARD============="
    puts player_board.render(true)
    # ********* Add a guard clause for invalid placements and off-board placements *********
    # if player_board.ship

    loop do
      puts "Enter a coordinate to fire upon"
      player_shot = ""
      loop do
        player_shot = gets.chomp.upcase
        if !computer_board.valid_coordinate?(player_shot)
          puts "Invalid coordinate"
        elsif computer_board.cells[player_shot].fired_upon?
          puts "You already fired there!"
        else
          break
        end
      end
      computer_board.cells[player_shot].fire_upon
      computer.random_fire_upon(player_board)
      # player_board.cells.random_fire_upon
      puts "=============COMPUTER BOARD============="
      puts computer.board.render
      puts "=============PLAYER BOARD============="
      puts player_board.render(true)
      if player_cruiser.sunk? && player_submarine.sunk?
        puts "=============GAME OVER============="
        puts "The computer won! You good."
        break
      elsif computer_cruiser.sunk? && computer_submarine.sunk?
        puts "=============GAME OVER============="
        puts "You won! You're not the worst..."
        break
      end

    end
  end

startup
