class DayOne
  def part_one(filename)
    File.read(filename).split("\n\n").map do |cals|
      cals.split("\n").map(&:to_i).sum
    end.max
  end

  def part_two(filename)
    File.read(filename).split("\n\n").map do |cals|
      cals.split("\n").map(&:to_i).sum
    end.sort.reverse.slice(0..2).sum
  end
end