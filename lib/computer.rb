class Computer
  attr_reader :board

  def initialize(board)
    @board = board
    @available_cells = @board.cells.keys
  end

  def generate_placement(ship)
    loop do
      coordinates = @board.cells.keys.each_cons(ship.length).to_a.sample
      if @board.valid_placement?(ship, coordinates)
        @board.place(ship, coordinates)
        break
      end
    end
  end

  def random_fire_upon(player_board)
    @available_cells.shuffle!
    target_coord = @available_cells.pop
    player_board.cells[target_coord].fire_upon
    target_coord
  end

end
