
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

 def succession?(array_vars)
    return array_vars.each_cons(2).all? {|co| co[1] == co[0].succ}
 end

  def valid_placement?(ship, coords)
    return false if ship.length != coords.length

    rows = coords.map {|coord| coord[0]}
    columns = coords.map {|coord| coord[1]}

    row_in_succession = succession?(rows)
    same_row = rows.uniq.length == 1

    column_in_succession = succession?(columns)
    same_column = columns.uniq.length == 1

    if row_in_succession && same_column
      true
    elsif column_in_succession && same_row
      true
    else
      false
    end
  end

end
