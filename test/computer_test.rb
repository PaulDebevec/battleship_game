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
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_has_a_board
     assert_instance_of Board, @computer.board
  end


end
