require './lib/cell'

class Board
    attr_reader :cells

  def initialize
    @cells = {}
    @width = ("A".."D")
    @height = 1..4
    populate_cells
  end

  # Populates each cell with a cell object
  def populate_cells
    @width.each do |letter|
      @height.each do |number|
        cell_coords = "#{letter}#{number}"
        @cells[cell_coords] = Cell.new(cell_coords)
      end
    end
  end

  # Checks the cell to verify the input coord is in the cells list of keys
  def valid_coordinate?(coord)
    @cells.key?(coord)
  end

  # Verifies the ship placement is in a valid coordinate set
  def valid_placement?(ship, coords)
    coords.each do |coord|
      return false if !valid_coordinate?(coord)
    end
    return false if ship.length != coords.length || !no_ship_in_cell(coords)

    rows = coords.map {|coord| coord[0]}
    columns = coords.map {|coord| coord[1]}

    succession?(rows) && same?(columns) || succession?(columns) && same?(rows)
  end

# Helper method for valid_placement? checks if the numbers or letters are the same
  def same?(array_to_check)
    return array_to_check.uniq.length == 1
  end

# Helper method for valid_placement? checks succession of letters or numbers
  def succession?(array_vars)
     return array_vars.each_cons(2).all? {|co| co[1] == co[0].succ}
  end

  # Allows user to place their ships
  def place(ship, coords)
    return "Invalid placement" if !valid_placement?(ship, coords) || !no_ship_in_cell(coords)
    coords.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end

# Helper method for place
  def no_ship_in_cell(coords)
    coords.all? do |coord|
      @cells[coord].empty?
    end
  end

  # Static board render
  def render(show_cell = false)
    "  1 2 3 4 \n" +
     "A #{@cells.values[0].render(show_cell)} #{@cells.values[1].render(show_cell)} #{@cells.values[2].render(show_cell)} " +
     "#{@cells.values[3].render(show_cell)} \nB #{@cells.values[4].render(show_cell)} #{@cells.values[5].render(show_cell)} " +
     "#{@cells.values[6].render(show_cell)} #{@cells.values[7].render(show_cell)} \nC #{@cells.values[8].render(show_cell)} " +
     "#{@cells.values[9].render(show_cell)} #{@cells.values[10].render(show_cell)} #{@cells.values[11].render(show_cell)} \n" +
     "D #{@cells.values[12].render(show_cell)} #{@cells.values[13].render(show_cell)} #{@cells.values[14].render(show_cell)} " +
     "#{@cells.values[15].render(show_cell)} \n"
  end
end
