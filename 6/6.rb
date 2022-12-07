class Day6
  def initialize(file)
    @input = parse_file(file)
  end

  def part_one
    uniq_x_chars(4)
  end

  def part_two
    uniq_x_chars(14)
  end

  def uniq_x_chars(num)
    @input.each_with_index do |char, i|
      return i+num if @input[i..(i+num-1)].uniq.length == num
    end
  end

  def parse_file(file)
    File.readlines(file, chomp: true).first.split('')
  end
end
  