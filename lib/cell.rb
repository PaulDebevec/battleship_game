class Cell

  attr_reader :coordinate, :ship, :fired

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired = false
  end

  def empty?
    @ship.nil?
  end
# board.cells.values[0].ship
  def place_ship(boat)
    @ship = boat
  end

  def fired_upon?
    @fired
  end

  # fire_upon only allows user to fire on a cell once.
  def fire_upon
    return "You already fired there!" if fired_upon?

    if @ship != nil
      @ship.hit
    end
    @fired = true
  end

  def render(show_cell = false)
    if !empty? && ship.sunk?
      "X"
    elsif fired_upon? && empty?
      "M"
    elsif !empty? && fired_upon?
      "H"
    elsif show_cell && !empty?
      "S"
    else
      "."
    end
  end

end
