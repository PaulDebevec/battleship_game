require'minitest/autorun'
require'minitest/pride'
require'./lib/ship'
require'./lib/cell'
require'./lib/board'
require'pry'

@computer_board = Board.new
@player_board = Board.new
@cruiser = Ship.new("Cruiser", 3)
@computer_cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)
@computer_submarine = Ship.new("Submarine", 2)

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."



puts "=============COMPUTER BOARD============="
puts @computer_board.render

puts "=============PLAYER BOARD============="
puts @player_board.render(true)

puts "I have laid out my ships on the grid."
puts "You now need to lay out your two ships."
puts "The Cruiser is three units long and the Submarine is two units long."

puts "Enter the squares for the Cruiser (3 spaces)"

puts @board.render(true)

"Enter the squares for the Submarine (2 spaces):"
