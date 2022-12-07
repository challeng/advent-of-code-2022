class Day2
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    me = ['X', 'Y', 'Z']

    @inputs.map do |o,m|
      points = case (me.index(m) - opponent.index(o)) % 3
      when 1
        6
      when 0
        3
      when 2
        0
      end

      points + me.index(m) + 1
    end.sum
  end

  def part_two
    outcomes = ['X', 'Y', 'Z']

    @inputs.map do |opp,out|
      move_score = if out == 'Z'
        (opponent.index(opp) + 1) % 3 + 1
      elsif out == 'Y'
        opponent.index(opp) + 1
      else
        opponent.index(opp) == 0 ? 3 : opponent.index(opp)
      end

      outcomes.index(out) * 3 + move_score
    end.sum
  end

  def opponent
    ['A', 'B', 'C']
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
      line.split(' ')
    end
  end
end
  