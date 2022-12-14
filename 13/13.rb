class Day13
  def initialize(file)
    @inputs = parse_file(file)
  end

  def part_one
    @inputs.each_with_index.reduce(0) do |acc, ((g1,g2), i)|
      acc += i + 1 if compare(g1,g2) == -1
      acc
    end
  end

  def compare(el1, el2)
    if el1.is_a?(Integer) && el2.is_a?(Integer)
      return -1 if el1 < el2
      return 1 if el1 > el2
      0
    elsif el1.nil? && !el2.nil?
      -1
    elsif !el1.nil? && el2.nil?
      1
    elsif el1.is_a?(Array) && el2.is_a?(Array)
      diff = el1.length - el2.length
      ar = if diff < 0
        (el1 + Array.new(diff.abs)).zip(el2)
      elsif diff > 0
        el1.zip(el2 + Array.new(diff))
      else
        el1.zip(el2)
      end

      ar.each do |ei1, ei2|
        res = compare(ei1,ei2)
        return res if res == 1 || res == -1
      end
    elsif el1.is_a?(Integer) && el2.is_a?(Array)
      compare([el1], el2)
    elsif el1.is_a?(Array) && el2.is_a?(Integer)
      compare(el1,[el2])
    end
  end

  def part_two
    dividers = [[[2]], [[6]]]
    sorted = (@inputs.flatten(1) + dividers).sort {|el1,el2| compare(el1,el2)}
    (sorted.index(dividers.first) + 1) * (sorted.index(dividers.last) + 1)
  end

  def parse_file(file)
    File.read(file).split("\n\n").map do |group|
      group.split("\n").map {|el| eval(el) }
    end
  end
end
  