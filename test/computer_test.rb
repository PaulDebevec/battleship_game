require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class ComputerTest < MiniTest::Test

  def setup
    @board = Board.new
    @computer = Computer.new(@board)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_initialize
     assert_instance_of Board, @computer.board
  end

  def test_it_can_place_ships
    @computer.generate_placement(@computer_cruiser)
    @computer.generate_placement(@computer_submarine)
    actual = @computer.board.cells.values.all? do |cell_obj|
      cell_obj.ship.nil?
    end
    assert_equal false, actual
  end

  def test_it_fires_on_random_cell
    player_board = Board.new
    expected = true
    fired_on_cell = @computer.random_fire_upon(player_board)
    actual = player_board.cells[fired_on_cell].fired_upon?

    assert_equal expected, actual
  end

end
