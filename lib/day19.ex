defmodule AdventOfCode.Day19 do

  def handle_input(input1, input2), do: input1 |> parse_input |> calculate_answer(to_char_list(input2))

  def parse_input(input), do: input |> String.split("\n") |> Enum.map(&parse_line/1)

  def parse_line(line) do
    [from, _, to] = String.split(line)
    {to_char_list(from), to_char_list(to)}
  end

  def calculate_answer(conversions, original) do
    (for {from, to} <- conversions, char <- 0..length(original) - 1, do: create_conversion(from, to, original, char))
    |> Enum.filter(fn x -> x != nil end)
    |> Enum.into(HashSet.new)
    |> Set.size
  end

  def create_conversion([_a,_b], _to, original, char) when char == length(original) - 1, do: nil
  def create_conversion([a,b], to, original, char) do
    case {Enum.at(original, char), Enum.at(original, char + 1)} do
      {^a, ^b} -> (original |> Enum.split(char) |> elem(0)) ++ to ++ (original |> Enum.split(char + 2) |> elem(1))
      _        -> nil
    end
  end

  def create_conversion([a], to, original, char) do
    case Enum.at(original, char) do
      ^a -> (original |> Enum.split(char) |> elem(0)) ++ to ++ (original |> Enum.split(char + 1) |> elem(1))
      _  -> nil
    end
  end

end