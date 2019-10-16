class Computer
  attr_reader :board

  def initialize(board)
    @board = board
    @fired = false
  end

  def generate_placement(ship)
    loop do
      coordinates = @board.cells.keys.each_cons(ship.length).to_a.sample
      if @board.valid_placement?(ship, coordinates) && @board.no_ship_in_cell(coordinates)
        @board.place(ship, coordinates)
        break
      end
    end
  end

  def fired_upon?
    @fired
  end

  def fire_upon
    return if fired_upon?

    @board.cells.keys.sample
    @fired = true
  end

end
