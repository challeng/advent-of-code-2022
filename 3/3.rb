class Day3
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    @inputs.map do |line|
      half = line.length / 2 - 1
      char = (line[0..half].split('') & line[half+1..-1].split(''))[0]
      score_from_letter(char)
    end.sum
  end

  def score_from_letter(letter)
    (('a'..'z').zip(1..26) + ('A'..'Z').zip(27..52)).find do |l, num|
      letter == l
    end[1]
  end

  def part_two
    @inputs.each_slice(3).map do |group|
      char = group.map { |g| g.split('') }.reduce(:intersection)[0]
      score_from_letter(char)
    end.sum
  end

  def parse_file(file)
    File.readlines(file, chomp: true)
  end
end
  