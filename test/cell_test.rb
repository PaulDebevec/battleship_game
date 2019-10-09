require'minitest/autorun'
require'minitest/pride'
require'./lib/ship'
require'./lib/cell'
require'./lib/render'
require'pry'

class CellTest < Minitest::Test

  def setup
    @cell_1 = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
  assert_instance_of Cell, @cell_1
  end

  def test_it_has_a_coordinate
  assert_equal "B4", @cell_1.coordinate
  end

  def test_it_has_a_ship
  assert_equal nil, @cell_1.ship
  end

  def test_it_is_empty
  assert_equal true, @cell_1.empty?
  end

  def test_it_can_place_ship
  skip
  assert_equal @cruiser, @cell_1.place_ship(@cruiser)
  end

  def test_it_has_a_ship
  skip
  assert_equal @cruiser, @cell_1.ship
  end

  def test_it_is_empty
  skip
  assert_equal false, @cell.empty?
  end

#fire_upon testing
  def test_has_it_been_fired_upon
  skip
  assert_equal false, @cell.fired_upon?
  end

  def test_it_can_be_fired_upon
  skip
  @cell.fire_upon
  assert_equal 2, @cell.health
  assert_equal true, @cell.fired_upon?
  end

#render testing
  def test_it_has_a_render
  skip
  assert_equal '.', @cell_1.render
  end
end
