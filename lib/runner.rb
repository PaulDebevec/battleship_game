require'minitest/autorun'
require'minitest/pride'
require'./lib/ship'
require'./lib/cell'
require'./lib/board'
require'pry'

computer_board = Board.new
player_board = Board.new
cruiser = Ship.new("Cruiser", 3)
computer_cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
computer_submarine = Ship.new("Submarine", 2)

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."
# gets.chomp

puts "=============COMPUTER BOARD============="
puts computer_board.render

puts "=============PLAYER BOARD============="
puts player_board.render(true)


# some method that allows us to continue with 'p'
# this method should initiate the compoter-generated placement

p "I have laid out my ships on the grid."
p "You now need to lay out your two ships."
p "The Cruiser is three units long and the Submarine is two units long."
p "
1 2 3 4
A . . . .
B . . . .
C . . . .
D . . . .
"
p "Enter the squares for the Cruiser (3 spaces):"
  coords = gets.chomp
  @board.place_ship(@cruiser, coords)

p @board.render(true)

"Enter the squares for the Submarine (2 spaces):"
