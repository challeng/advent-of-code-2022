class Day4
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    @inputs.count do |r1,r2|
      (r1 & r2) == r1 || (r1 & r2) == r2
    end
  end

  def part_two
    @inputs.count do |r1,r2|
      !(r1 & r2).empty?
    end
  end

  def parse_file(file)
    File.readlines(file, chomp: true).map do |line, i|
      line.split(',').map do |range| 
        r1,r2 = range.split('-')
        (r1..r2).to_a
      end
    end
  end
end
  