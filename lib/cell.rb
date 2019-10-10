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

  def fire_upon
    # Guard clause returns if truthy
    # Code bails out early if the condition is met (cell has been fired upon)
    # one line if statement
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
    if show_cell && !empty?
      return "S"
    elsif !empty? && @ship.sunk?
      return "X"
    else
      return @render
    end
  end

end
