class Day9
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    find_num_tail_visits(1)
  end

  def part_two
    find_num_tail_visits(9)
  end

  def find_num_tail_visits(tail_count)
    visited = Set.new([[0,0]])
    knots = Hash[((0..tail_count).to_a).collect {|el| [el, [0,0]]}]

    @inputs.each do |dir, n|
      mx,my = {"R" => [1,0], "L" => [-1,0], "U" => [0,1], "D" => [0,-1]}[dir]

      n.to_i.times do 
        knots[0] = [knots[0][0]+mx,knots[0][1]+my]
        knots.keys[1..-1].each do |n|
          new_tail_loc = move_tail(knots[n-1], knots[n])
          knots[n] = new_tail_loc unless new_tail_loc.nil?
          visited.add(knots[n]) if n == knots.keys.last
        end
      end
    end

    visited.count
  end

  def move_tail((hx,hy),(tx,ty))
    return if (hx-tx).abs <= 1 && (hy-ty).abs <= 1

    nx = (hx-tx).clamp(-1,1)
    ny = (hy-ty).clamp(-1,1)
    [tx+nx,ty+ny]
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map {|line| line.split(' ')}
  end
end
  