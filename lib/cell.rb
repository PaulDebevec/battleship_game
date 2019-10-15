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
    return if fired_upon?

    if @ship != nil
      @ship.hit
    end
    @fired = true
  end

  def render(show_cell = false)
    if show_cell && !empty?
      @render = "S"
    elsif fired_upon? && !empty? && @ship.hit
      @render = "H"
    elsif !empty? && @ship.sunk?
      @render = "X"
    elsif fired_upon? && empty?
      @render = "M"
    else
      return @render
    end
  end

end
