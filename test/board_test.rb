require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_does_the_board_exist
    expected = Board
    actual = @board

    assert_instance_of expected, actual
  end

  def test_board_cells_is_a_hash
    expected = Hash
    actual = @board.cells

    assert_kind_of expected, actual
  end

  def test_board_contains_cell_class_cell_keys
    expected_keys = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    actual = @board.cells.keys
    assert_equal expected_keys, actual
  end

  def test_do_cells_contain_cell_class
    @board.cells.each do |_key, val|
      assert_instance_of Cell, val
    end
  end

  def test_is_cell_a_valid_coordinate
    
  end

end