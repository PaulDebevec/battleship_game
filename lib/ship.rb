class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  # calling hit allows user to damage ship in cell
  def hit
    if health > 0
      @health -= 1
    end
  end

  # sunk? is assigned to a ship-in-cell once health hits 0
  def sunk?
    @health == 0
  end
end
