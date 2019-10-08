require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
  end

  def test_the_ship_exists
    ship = Ship.new("Cruiser", 3, 3)
    assert_instance_of Ship, ship
  end

  def test_ship_has_a_name
    ship = Ship.new("Cruiser", 3, 3)
    assert_equal "Cruiser", ship.name
  end

  def test_ship_length
    ship = Ship.new("Cruiser", 3, 3)
    assert_equal 3, ship.length
  end

  def test_ship_health
    ship = Ship.new("Cruiser", 3, 3)
    assert_equal 3, ship.health
  end

  def test_is_the_ship_sunk
    ship_1 = Ship.new("Cruiser", 3, 2)
    ship_2= Ship.new("Cruiser", 3, 0)
    assert_equal false, ship_1.sunk?
    assert_equal true,  ship_2.sunk?
  end

end
