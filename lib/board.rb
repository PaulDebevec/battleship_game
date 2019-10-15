require './lib/cell'

class Board
    attr_reader :cells
    attr_accessor :render

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

# Helper method for valid_placement?
  def same?(array_to_check)
    return array_to_check.uniq.length == 1
  end

# Helper method for valid_placement?
  def succession?(array_vars)
     return array_vars.each_cons(2).all? {|co| co[1] == co[0].succ}
  end

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

  def render(show_cell = false)
    @cells.values.map { |cell| "#{cell.render(show_cell)}" }

    "  1 2 3 4 \nA #{@cells.values[0].render} #{@cells.values[1].render} #{@cells.values[2].render} #{@cells.values[3].render} \nB #{@cells.values[4].render} #{@cells.values[5].render} #{@cells.values[6].render} #{@cells.values[7].render} \nC #{@cells.values[8].render} #{@cells.values[9].render} #{@cells.values[10].render} #{@cells.values[11].render} \nD #{@cells.values[12].render} #{@cells.values[13].render} #{@cells.values[14].render} #{@cells.values[15].render} \n"
  end
end
