defmodule DayOne do
  def part_one do
    total_cals()
      |> Enum.max
  end

  def part_two do
    total_cals()
      |> Enum.sort
      |> Enum.reverse
      |> Enum.take(3)
      |> Enum.sum
  end

  def total_cals do
    {:ok, inputs} = File.read("./input.txt")
    inputs 
      |> String.split("\n\n")
      |> Enum.map(&String.split/1)
      |> Enum.map(fn(cals) -> 
        Enum.map(cals, fn(cal) ->
          {int,_} = Integer.parse(cal)
          int
        end)
      end)
      |> Enum.map(&Enum.sum/1)
  end
end

IO.puts DayOne.part_one
IO.inspect DayOne.part_two