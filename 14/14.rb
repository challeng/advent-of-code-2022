class Day14
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    start = [500,0]  
    sand_moving = false
    sand_loc = start
    sand_count = 0
    lowest = @grid.keys.map {|x,y| y}.max

    loop do
      break if sand_loc[1] > lowest

      if !sand_moving
        sand_loc = start
        @grid[sand_loc] = 'o'
        sand_moving = true
        sand_count += 1
      else
        x,y = sand_loc
        @grid[sand_loc] = '.'
        if @grid[[x,y+1]] == '.'
          sand_loc = [x,y+1]
        elsif @grid[[x-1,y+1]] == '.'
          sand_loc = [x-1,y+1]
        elsif @grid[[x+1,y+1]] == '.'
          sand_loc = [x+1,y+1]
        else
          sand_moving = false
        end
        @grid[sand_loc] = 'o'
      end
    end

    sand_count - 1
  end

  def part_two
    start = [500,0]  
    sand_moving = false
    sand_loc = start
    sand_count = 0
    lowest = @grid.keys.map {|x,y| y}.max

    loop do
      if !sand_moving
        break if @grid[start] == 'o'
        sand_loc = start
        @grid[sand_loc] = 'o'
        sand_moving = true
        sand_count += 1
      else
        x,y = sand_loc
        @grid[sand_loc] = '.'
        if @grid[[x,y+1]] == '.' && y+1 != lowest + 2
          sand_loc = [x,y+1]
        elsif @grid[[x-1,y+1]] == '.' && y+1 != lowest + 2
          sand_loc = [x-1,y+1]
        elsif @grid[[x+1,y+1]] == '.' && y+1 != lowest + 2
          sand_loc = [x+1,y+1]
        else
          sand_moving = false
        end
        @grid[sand_loc] = 'o'
      end
    end

    sand_count
  end

  def parse_file(file)
    @grid = Hash.new('.')
    File.readlines(file, chomp: true).each do |line|
      coors = line.split(' -> ').map {|c| c.split(',').map(&:to_i)}
      loop do
        break if coors.length == 1
        cx,cy = coors.shift
        @grid[[cx,cy]] = '#'
        nx,ny = coors.first
        xrange = Range.new(*[[cx, nx].min, [cx, nx].max])
        yrange = Range.new(*[[cy, ny].min, [cy, ny].max])
        xrange.each do |x|
          yrange.each {|y| @grid[[x,y]] = '#'}
        end
      end
    end
  end
end
  