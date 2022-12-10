class Day10
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    x = 1
    cycles = []
    @inputs.each do |com, num|
      cycles << x and next if com == 'noop'
      cycles << x
      cycles << x
      x += num.to_i
    end

    [20, 60, 100, 140, 180, 220].sum { |n| n * cycles[n-1] }
  end

  def part_two
    @crt = Array.new(6) { Array.new(40,'.') }
    @x = 1
    @cycles = 0

    @inputs.each do |com, num|
      do_cyle and next if com == 'noop'
      do_cyle
      do_cyle
      @x += num.to_i
    end

    @crt.each {|r| puts r.join('')}
  end

  def do_cyle
    crt_x, crt_y = [@cycles % 40, @cycles / 40]
    sprite_slots = [@x-1, @x, @x+1]
    pixel = sprite_slots.include?(crt_x) ? '#' : '.'
    @crt[crt_y][crt_x] = pixel
    @cycles += 1
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map {|line| line.split(' ')}
  end
end
  