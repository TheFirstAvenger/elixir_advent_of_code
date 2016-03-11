defmodule AdventOfCode.Day20 do

  def handle_input(input), do: find_answer(input)

  def find_answer(target), do: _find_answer(target, calculate_house(1), 1, 0)
  def _find_answer(target, presents, house, _current_max) when presents >= target, do: house
  def _find_answer(target, _presents, house, current_max) do
    if _presents > current_max do
      IO.puts "#{_presents} presents at house #{house}" 
    end
    _find_answer(target, calculate_house(house + 1), house + 1, max(current_max, _presents))
  end

  def calculate_house(i), do: 1..i |> Enum.to_list |> Enum.map(&calculate_elf_at_house(&1, i)) |> Enum.sum
  def calculate_elf_at_house(elf, house), do: _handle_elf_at_house(rem(house, elf) == 0, elf)
  def _handle_elf_at_house(true, elf), do: elf * 10
  def _handle_elf_at_house(_,_), do: 0

end