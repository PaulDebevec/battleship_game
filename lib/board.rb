
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
    return false if ship.length != coords.length

    rows = coords.map {|coord| coord[0]}
    columns = coords.map {|coord| coord[1]}

    succession?(rows) && same?(columns) || succession?(columns) && same?(rows)
  end

  def same?(array_to_check)
    return array_to_check.uniq.length == 1
  end

  def succession?(array_vars)
     return array_vars.each_cons(2).all? {|co| co[1] == co[0].succ}
  end

  def place(ship, coords)
    return "Invalid placement" if !valid_placement?(ship, coords) || !no_ship_in_cell(coords)
    coords.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end

  def no_ship_in_cell(coords)
    coords.all? do |coord|
      @cells[coord].empty?
    end
  end
end
