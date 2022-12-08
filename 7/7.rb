class Day7
  def initialize(file)
    parse_file(file)
  end

  def part_one
    @sizes.select {|k,v| v <= 100000}.values.reduce(:+)
  end

  def part_two
    unused_space = 70000000 - @sizes["/"]
    @sizes.select do |k,v|
      v + unused_space >= 30000000
    end.values.min
  end

  def parse_file(file)
    @sizes = Hash.new(0)
    dir_stack = []

    File.readlines(file, chomp: true).each do |line|
      case line.split(' ')
      in ['$', 'cd', '..']
        dir_stack.pop
      in ['$', 'cd', dir]
        dir_stack << dir
      in ['$', 'ls']
      in ['dir', dir]
      in [size, filename]
        dir_stack.length.times do |n|
          @sizes[dir_stack[0..n].join('')] += size.to_i
        end
      end
    end
  end
end
  