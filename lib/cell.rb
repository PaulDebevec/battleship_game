class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired = false
    @render = "."
  end

  def empty?
    @ship.nil?
  end

  def place_ship(boat)
    @ship = boat
  end

  def fired_upon?
    @fired
  end

  # fire_upon only allows user to fire on a cell once.
  def fire_upon
    # Guard clause returns if truthy
    # Code bails out early if the condition is met (cell has been fired upon)
    return if fired_upon?

    @fired = true
    if empty?
      @render = "M"
    else
      @ship.hit
      @render = "H"
    end
  end

  def render(show_cell = false)
    # if show sell and cell is not empty, returns "S"
    if show_cell && !empty?
      return "S"
    # if the cell has a ship, and if it triggers .sunk? return "X"
    elsif !empty? && @ship.sunk?
      return "X"
    else
      # If the above both fail, return the @render
      return @render
    end
  end

end
