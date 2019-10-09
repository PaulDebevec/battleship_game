class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def empty?
    @ship == []
  end

  def place_ship(boats)
    @ship << boats
    @ship[0]
  end

end
