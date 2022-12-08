class Day8
  def initialize(file)
    parse_file(file)
  end

  def part_one
    @grid.count { |(x,y),val| tree_visible_from_outside?(x,y) }
  end

  def part_two
    @grid.map { |(x,y),val| score_for(x,y) }.max
  end

  def score_for(x,y)
    ((1..x).find {|n| @grid[[x-n,y]] >= @grid[[x,y]]} || x) *
      ((1..@max_x-x).find {|n| @grid[[x+n,y]] >= @grid[[x,y]]} || @max_x-x) *
      ((1..y).find {|n| @grid[[x,y-n]] >= @grid[[x,y]]} || y) *
      ((1..@max_y-y).find {|n| @grid[[x,y+n]] >= @grid[[x,y]]} || @max_y-y)
  end

  def tree_visible_from_outside?(x,y)
    return true if x == 0 || y == 0
    (0...x).all? {|tx| @grid[[tx,y]] < @grid[[x,y]]} ||
      (x+1..@max_x).all? {|tx| @grid[[tx,y]] < @grid[[x,y]]} ||
      (0...y).all? {|ty| @grid[[x,ty]] < @grid[[x,y]]} ||
      (y+1..@max_y).all? {|ty| @grid[[x,ty]] < @grid[[x,y]]}
  end

  def parse_file(file)
    lines = File.readlines(file, chomp: true)
    @grid = {}
    @max_x = lines.first.length - 1
    @max_y = lines.length - 1
    lines.each_with_index do |line, y|
      line.split('').each_with_index { |c, x| @grid[[x,y]] = c.to_i }
    end
  end
end
  