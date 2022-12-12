class Day11
  def initialize(file)
    @monkeys = {}
    parse_file(file)
  end

  def part_one
    20.times do
      @monkeys.each do |n, data|
        data[:items].each do |item|
          data[:inspects] += 1
          second_math_param = data[:operation][1] == "old" ? item : data[:operation][1].to_i
          new_item = item.send(data[:operation][0], second_math_param) / 3
          if new_item % data[:test][:com] == 0
            @monkeys[data[:test][:t]][:items] << new_item
          else
            @monkeys[data[:test][:f]][:items] << new_item
          end
        end
        data[:items] = []
      end
    end

    @monkeys.map { |n,data| data[:inspects] }.sort.reverse.take(2).reduce(:*)
  end

  def part_two
    divisibles = @monkeys.map {|n,data| data[:test][:com] }
    @monkeys.each do |n,data|
      new_items = data[:items].map do |item|
        divisibles.each_with_object({}) {|d,divs| divs[d] = item % d}
      end
      data[:items] = new_items
    end

    10000.times do |count|
      @monkeys.each do |n, data|
        data[:items] = data[:items].map do |divs|
          divs.each_with_object({}) do |(div, mod), updated_item|
            second_math_param = data[:operation][1] == "old" ? mod : data[:operation][1].to_i
            updated_item[div] = mod.send(data[:operation][0], second_math_param) % div
          end
        end

        data[:items].each do |divs|
          data[:inspects] += 1
          if divs[data[:test][:com]] == 0
            @monkeys[data[:test][:t]][:items] << divs
          else
            @monkeys[data[:test][:f]][:items] << divs
          end
        end
        data[:items] = []
      end
    end

    @monkeys.map { |n,data| data[:inspects] }.sort.reverse.take(2).reduce(:*)
  end

  def parse_file(file)
    File.read(file).split("\n\n").each do |monkey|
      lines = monkey.split("\n")
      @monkeys[lines[0].split(' ')[1][0].to_i] = {
        items: lines[1].split(' ')[2..-1].map(&:to_i),
        operation: lines[2].split(' ')[-2..-1],
        test: {com: lines[3].split(' ')[-1].to_i, t: lines[4].split(' ')[-1].to_i, f: lines[5].split(' ')[-1].to_i},
        inspects: 0
      }
    end
  end
end
  