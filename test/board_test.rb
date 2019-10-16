require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_does_it_exits
    assert_instance_of Board, board
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
    #testing truth
    expected = true
    actual = @board.valid_coordinate?("A1")
    assert_equal expected, actual

    actual = @board.valid_coordinate?("D3")
    assert_equal expected, actual

    #testing false
    expected = false
    actual = @board.valid_coordinate?("G3")
    assert_equal expected, actual

    actual = @board.valid_coordinate?("Z9")
    assert_equal expected, actual
  end

  def test_is_the_ship_on_a_valid_horizontal_placement
    expected = false
    actual = @board.valid_placement?(@cruiser, %w[A1 A2])
    assert_equal expected, actual

    actual = @board.valid_placement?(@submarine, %w[A2 A3 A4])
    assert_equal expected, actual

    expected = true
    actual = @board.valid_placement?(@cruiser, %w[B1 B2 B3])
    assert_equal expected, actual

    actual = @board.valid_placement?(@submarine, %w[C2 C3])
    assert_equal expected, actual
  end

  def test_is_ship_on_a_valid_vertical_placement
    expected = true
    actual = @board.valid_placement?(@cruiser, %w[A1 B1 C1])
    assert_equal expected, actual

    actual = @board.valid_placement?(@submarine, %w[B3 C3])
    assert_equal expected, actual

    expected = false
    actual = @board.valid_placement?(@cruiser, %w[A1 B4 C2])
    assert_equal expected, actual

    actual = @board.valid_placement?(@submarine, %w[B3 C1])
    assert_equal expected, actual
  end

  def test_ships_cannot_be_placed_diagonally
    expected = false
    actual = @board.valid_placement?(@submarine, %w[A1 B2])
    assert_equal expected, actual

    actual = @board.valid_placement?(@cruiser, %w[A1 B2 C3])
    assert_equal expected, actual
  end

  def test_place_ship_places_ship
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    actual = @board.place(@cruiser, %w[A1 A2 A3])
    assert_equal cell_1.ship, cell_2.ship
    assert_equal cell_3.ship, cell_2.ship
  end

  def test_place_ship_changes_render_value_to_S_when_render_is_true
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    actual = @board.place(@cruiser, %w[A1 A2 A3])
    actual = cell_1.render(true)
    @board.place(@cruiser, %w[A1 A2 A3])
    expected = "S"
    assert_equal expected, actual
  end

  def test_place_ship_maintains_render_value_is_a_period_when_render_is_false
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    actual = @board.place(@cruiser, %w[A1 A2 A3])
    actual = cell_1.render
    @board.place(@cruiser, %w[A1 A2 A3])
    expected = "."
    assert_equal expected, actual
  end

  def test_ship_placement_does_not_overlap
    expected = "Invalid placement"
    @board.place(@cruiser, %w[A1 A2 A3])

    actual = @board.place(@submarine, %w[A1 A2])
    assert_equal expected, actual
  end

  def test_board_render
    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    actual = @board.render
    assert_equal expected, actual
  end

end
