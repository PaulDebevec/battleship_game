require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

def startup

  # @computer = Computer.new
  # @computer_board = Board.new
  # @player_board = Board.new
  @cruiser = Ship.new("Cruiser", 3)
  # @computer_cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  # @computer_submarine = Ship.new("Submarine", 2)
  # @user_input = gets.chomp

  def board_setup
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

    # binding.pry
    player_input = gets.chomp.split(" ")
    place_ship = player_board.place(player_cruiser, player_input)

    # player_input.each do |coord|
    #   coord.valid_coordinate?
    #   # puts "Invalid coordinate"
    #   end
    # end


    puts "=============COMPUTER BOARD============="
    puts computer.board.render
    puts "=============PLAYER BOARD============="
    puts player_board.render(true)
    # binding.pry

  end

  # def take_turn
    # until @cruiser.sunk? && @submarine.sunk? || @computer_cruiser.sunk? && @computer_submarine.sunk?
  #
  #   end
  # end
  #
  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    user_input = gets.chomp
    if user_input == "p" || "P"
      board_setup
    elsif user_input == "q" || "Q"
      puts "You suck"
    else
      "That's not what we asked for"
    end
  end

  main_menu
end

startup
