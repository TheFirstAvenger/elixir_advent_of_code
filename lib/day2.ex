defmodule AdventOfCode.Day2 do

  def handle_input(input) do
    input
    |> String.split
    |> Stream.map(&String.split(&1, "x"))
    |> Stream.map(&to_ints/1)
    |> Stream.map(&Enum.sort/1)
    |> Stream.map(&calculate_box/1)
    |> Enum.sum
  end

  def to_ints([a, b, c]), do: [int(a), int(b), int(c)]

  def int(v), do: v |> Integer.parse |> elem(0)

  def calculate_box([a, b, c]), do: 2*a*b + 2*b*c + 2*a*c + a*b

end