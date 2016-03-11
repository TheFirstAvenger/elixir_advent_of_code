defmodule AdventOfCode.Day20b do

  def handle_input(input), do: find_answer(input)

  def find_answer(target), do: _find_answer(target, calculate_house(1), 1, 0)
  def _find_answer(target, presents, house, _current_max) when presents >= target, do: house
  def _find_answer(target, _presents, house, current_max) do
    if _presents > current_max do
      IO.puts "#{_presents} presents at house #{house}" 
    end
    _find_answer(target, calculate_house(house + 1), house + 1, max(current_max, _presents))
  end

  def calculate_house(i), do: (factors(i) |> Enum.sum) * 10


  # http://stackoverflow.com/questions/28587249/how-can-this-code-be-better-structured-in-elixir

  def factors(i), do: [i | factors(i, div(i,2))]

  def factors(1, _), do: [1]
  def factors(_, 1), do: [1]
  def factors(n, i) do
    if rem(n, i) == 0 do
      [i|factors(n, i-1)]
    else
      factors(n, i-1)
    end
  end

end