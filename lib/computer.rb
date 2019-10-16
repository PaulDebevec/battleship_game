class Computer
  attr_reader :board

  def initialize(board)
    @board = board
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

end
