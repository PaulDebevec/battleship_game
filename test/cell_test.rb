require'minitest/autorun'
require'minitest/pride'
require'./lib/ship'
require'./lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_it_has_a_ship
    assert_nil nil, @cell_1.ship

    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
  end

  def test_it_is_empty
    assert_equal true, @cell_1.empty?

    @cell_1.place_ship(@cruiser)
    assert_equal false, @cell_1.empty?
  end

  def test_it_can_place_ship
    assert_equal @cruiser, @cell_1.place_ship(@cruiser)
  end

  #fire_upon testing
  def test_has_it_been_fired_upon
    assert_equal false, @cell_1.fired_upon?
  end

  def test_it_can_be_fired_upon
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon
    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
    assert_equal true, @cell_1.fired_upon?
  end

  #render testing
  def test_it_has_render_default
    assert_equal '.', @cell_1.render
  end

  def test_it_has_render_miss
    @cell_1.fire_upon
    assert_equal 'M', @cell_1.render
  end

  def test_it_has_render_ship_with_optional_argument
    @cell_2.place_ship(@cruiser)
    assert_equal '.', @cell_2.render
    assert_equal 'S', @cell_2.render(true)
  end

  def test_it_has_render_hit
    @cell_2.place_ship(@cruiser)
    @cell_2.render
    @cell_2.fire_upon
    assert_equal 'H', @cell_2.render
  end

  def test_it_has_render_sunk
    @cell_2.place_ship(@cruiser)
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    assert_equal 'X', @cell_2.render
  end

end
