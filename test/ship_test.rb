require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
  end

  def test_it_exists
    ship = Ship.new("Cruiser", 3, 3)
    assert_instance_of Ship, ship
  end

  def test_ship_length
    ship = Ship.new("Cruiser", 3, 3)
    assert_equal ship.length, 3
  end

  def test_ship_health
    ship = Ship.new("Cruiser", 3, 3)
    assert_equal(3, ship.health)
  end

end
