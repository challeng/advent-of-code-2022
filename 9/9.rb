class Day9
  def initialize(file)
    @inputs = parse_file(file)
    @visited = Set.new([[0,0]])
  end

  def part_one
    @knots = {0 => [0,0], 1 => [0,0]}
    find_num_tail_visits
  end

  def part_two
    @knots = Hash[((0..9).to_a).collect {|el| [el, [0,0]]}]
    find_num_tail_visits
  end

  def move_tail(h,t)
    hx,hy = @knots[h]
    tx,ty = @knots[t]
    return if (hx-tx).abs <=1 && (hy-ty).abs <= 1

    nx,ny = if hx-tx == 2 && hy-ty == 0
      [1,0]
    elsif hx-tx == -2 && hy-ty == 0
      [-1,0]
    elsif hx-tx == 0 && hy-ty == 2
      [0,1]
    elsif hx-tx == 0 && hy-ty == -2
      [0,-1]
    elsif hx-tx > 0 && hy-ty > 0
      [1,1]
    elsif hx-tx > 0 && hy-ty < 0
      [1,-1]
    elsif hx-tx < 0 && hy-ty < 0
      [-1,-1]
    elsif hx-tx < 0 && hy-ty > 0
      [-1,1]
    else
      [0,0]
    end

    @knots[t] = [tx+nx,ty+ny]
  end

  def find_num_tail_visits
    @inputs.each do |dir, n|
      mx,my = {"R" => [1,0], "L" => [-1,0], "U" => [0,1], "D" => [0,-1]}[dir]

      n.to_i.times do 
        x,y = @knots[0]
        @knots[0] = [x+mx,y+my]
        @knots.keys[1..-1].each do |n|
          move_tail(n-1, n)
          @visited.add(@knots[n]) if n == @knots.keys.last
        end
      end
    end

    @visited.count
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map {|line| line.split(' ')}
  end
end
  