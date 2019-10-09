require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @ship = Ship.new("Cruiser", 3)
  end

  def test_the_ship_exists
    assert_instance_of Ship, @ship
  end

  def test_ship_has_a_name
    assert_equal "Cruiser", @ship.name
  end

  def test_ship_length
    assert_equal 3, @ship.length
  end

  def test_ship_health
    assert_equal 3, @ship.health
  end

  def test_is_the_ship_sunk
    ship_1 = Ship.new("Cruiser", 3)
    ship_2 = Ship.new("Cruiser", 0)
    assert_equal false, ship_1.sunk?
    assert_equal true,  ship_2.sunk?
  end

  def test_hit_reduces_health
    assert_equal 3, @ship.health
    @ship.hit
    assert_equal 2, @ship.health
  end

  def test_hit_floors_health_at_zero
    ship_3 = Ship.new("Cruiser", 1)
    assert_equal 1, ship_3.health
    ship_3.hit
    ship_3.hit
    assert_equal 0, ship_3.health
  end

end
