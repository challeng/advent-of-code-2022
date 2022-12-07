class Day5
  def initialize(file)
    @stacks = {}
    @moves = []
    @inputs = parse_file(file)
  end

  def part_one
    @moves.each do |quantity, b1, b2|
      quantity.times { @stacks[b2] << @stacks[b1].pop }
    end

    @stacks.keys.sort.map { |k| @stacks[k].last }.join('')
  end

  def part_two
    @moves.each do |quantity, b1, b2|
      moving = @stacks[b1].slice(-quantity..-1)
      staying = @stacks[b1].slice(0..-quantity-1)
      @stacks[b2] = (@stacks[b2] << moving).flatten
      @stacks[b1] = staying
    end

    @stacks.keys.sort.map { |k| @stacks[k].last }.join('')
  end

  def parse_file(file)
    File.readlines(file, chomp: true).each do |line|
      if line.start_with?('move')
        split = line.split(' ')
        @moves << [split[1], split[3], split[5]].map(&:to_i)
      else
        sections = line.split('').each_slice(4)
        sections.each_with_index do |section, i|
          next if section.first == ' '
          @stacks[i+1] ||= []
          @stacks[i+1].prepend(section[1])
        end
      end
    end
  end
end
  