class Day12
  def initialize(file)
    @score_map = [*('a'..'z'),'S', 'E'].zip([*1..26, 1, 26]).to_h
    parse_file(file)
  end

  def part_one
    distances = distances_from_start(@graph1, @grid.key("S"))
    distances[@grid.key('E')]
  end

  def part_two
    distances = distances_from_start(@graph2, @grid.key("E"))
    @grid.select {|k,v| v == 'a'}.map do |k,v|
      distances[k]
    end.min
  end

  def distances_from_start(graph, start)
    distances = Hash.new(Float::INFINITY)
    distances[start] = 0
    unvisited_nodes = graph.keys

    while unvisited_nodes.length > 0 do
      un = unvisited_nodes.min_by {|un| distances[un] }
      unvisited_nodes = unvisited_nodes - [un]

      graph[un].each do |ncoor, v|
        distances[ncoor] = distances[un] + 1 if distances[un] + 1 < distances[ncoor]
      end
    end

    distances
  end

  def neighbors(x,y)
    [[x-1,y], [x+1,y], [x,y-1], [x,y+1]]
  end

  def parse_file(file)
    @grid = {}
    @graph1 = {}
    @graph2 = {}
    File.readlines(file, chomp: true).each_with_index do |line, y|
      line.split('').each_with_index { |c, x| @grid[[x,y]] = c }
    end
    @grid.each do |coor,c|
      ns1 = neighbors(coor[0],coor[1]).select do |ncoor|
        !@grid[ncoor].nil? && @score_map[c] >= @score_map[@grid[ncoor]] - 1
      end
      @graph1[coor] = ns1.zip([1]*4).to_h

      ns2 = neighbors(coor[0],coor[1]).select do |ncoor|
        !@grid[ncoor].nil? && (@score_map[c] -1 <= @score_map[@grid[ncoor]])
      end
      @graph2[coor] = ns2.zip([1]*4).to_h
    end
  end
end
  