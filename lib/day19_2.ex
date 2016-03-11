defmodule AdventOfCode.Day19_2 do

  def handle_input(input1, input2), do: input1 |> parse_input |> calculate_answer(Set.put(HashSet.new, [?e]), input2, 1)

  def parse_input(input), do: input |> String.split("\n") |> Enum.map(&parse_line/1)

  def parse_line(line) do
    [from, _, to] = String.split(line)
    {to_char_list(from), to_char_list(to)}
  end

  def calculate_answer(conversions, current_elements, target, iterations) do
    IO.puts "current_elements at iteration #{iterations-1} (#{Set.size(current_elements)}):"
    IO.inspect(current_elements)
    IO.puts "longest:"
    Enum.map(current_elements, &length(&1))
    |> Enum.max
    |> IO.puts
    next_iteration = current_elements
    |> Enum.map(&convert_element(conversions, &1))
    |> Enum.reduce(&Set.union(&1,&2))
    cond do
      Set.member?(next_iteration, target) -> iterations
      true -> calculate_answer(conversions, next_iteration, target, iterations + 1)
    end
  end

  def convert_element(conversions, elem) do
    (for {from, to} <- conversions, char <- 0..length(elem) - 1, do: create_conversion(from, to, elem, char))
    |> Enum.filter(fn x -> x != nil end)
    |> Enum.into(HashSet.new)
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