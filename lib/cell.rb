class Cell

  attr_reader :coordinate, :ship

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
      @fired = true
    end
    @fired = true
  end

  def render(show_cell = false)
    if show_cell && !empty?
      "S"
    elsif fired_upon? && !empty? && ship.hit
      "H"
    elsif !empty? && ship.sunk?
      "X"
    elsif fired_upon? && empty?
      "M"
    else
      "."
    end
  end

end
