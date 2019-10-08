class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def hit
    @health -= 1
  end

  def sunk?
    if health == 0
      true
    end
  end

end
