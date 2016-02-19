defmodule AdventOfCode.Day13 do

  def handle_input(input), do: input |> parse_values |> calculate_best

  def parse_values(input) do
    input
    |> String.split("\n")
    |> Enum.reduce(%{}, fn x, acc ->
                                  {p1, p2, diff} = parse_diff(x)
                                  Map.put(acc, {p1, p2}, diff)
                                end)
  end

  def parse_diff(str) do
    [p1,_,direction,magnitude,_,_,_,_,_,_,p2] = String.split(str)
    p2 = String.rstrip(p2, ?.)
    magnitude = magnitude |> Integer.parse |> elem(0)
    case direction do
      "gain" -> {p1,p2,magnitude}
      "lose" -> {p1,p2,-magnitude}
    end
  end

  def calculate_best(map) do
    unique_names = get_unique_names(map)
    perms = permutations(unique_names)
    perms_and_vals = Enum.map(perms, fn perm -> {perm, calculate_perm(perm, map)} end)
    {_best_perm, best_val} = Enum.reduce(perms_and_vals, fn {perm, val}, {best_perm, best_val} ->
                                                          cond do
                                                            val > best_val -> {perm, val}
                                                            true -> {best_perm, best_val}
                                                          end
                                                        end)
    best_val
  end

  #calculate the wraparound value and then use recursive call to sum all other interactions
  def calculate_perm(perm, map) do
    map[{List.last(perm), List.first(perm)}] + map[{List.first(perm), List.last(perm)}] + _calculate_perm(perm, map)
  end

  def _calculate_perm([a,b|tail], map), do: map[{a,b}] + map[{b,a}] + _calculate_perm([b|tail], map)
  def _calculate_perm([_], _map), do: 0

  def get_unique_names(map), do: map |> Map.keys |> Enum.reduce(HashSet.new, fn {a,b}, acc -> Set.put(acc, a) |> Set.put(b) end) |> Enum.into([])

  #https://github.com/seven1m/30-days-of-elixir/blob/master/11-sudoku-solver.exs
  def permutations([]), do: [[]]
  def permutations(list), do: (for h <- list, t <- permutations(list -- [h]), do: [h | t])

end