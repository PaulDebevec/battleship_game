
class Board
    attr_reader :cells

  def initialize
    @cells = {}
    @width = ("A".."D")
    @height = 1..4
    populate_cells
  end

  def populate_cells
    @width.each do |letter|
      @height.each do |number|
        cell_coords = "#{letter}#{number}"
        @cells[cell_coords] = Cell.new(cell_coords)
      end
    end
  end

  def valid_coordinate?(coord)
    @cells.key?(coord)
  end

  def valid_placement?(ship, coords)
    ship.length == coords.length
  end

end
