defmodule AdventOfCode.Day17_2 do

  def handle_input(input), do: input |> parse_lines |> calculate_answer

  def parse_lines(input), do: input |> String.split("\n") |> Enum.map(&int/1)

  def int(v), do: v |> Integer.parse |> elem(0)

  def calculate_answer(vals), do: _find_lowest(1, vals)

  def _find_lowest(i, vals) do
    case total_for_count(i, vals) do
      0 -> _find_lowest(i+1, vals)
      c -> c
    end
  end

  def total_for_count(i, vals), do: i |> combination(vals) |> Enum.map(&Enum.sum/1) |> Enum.filter(fn i -> i==150 end) |> length 

  # http://stackoverflow.com/questions/30585697/how-to-rewrite-erlang-combinations-algorithm-in-elixir
  def combination(0, _), do: [[]]
  def combination(_, []), do: []
  def combination(n, [x|xs]), do: (for y <- combination(n - 1, xs), do: [x|y]) ++ combination(n, xs)

end