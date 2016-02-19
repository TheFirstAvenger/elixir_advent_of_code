defmodule AdventOfCode.Day11 do

  def handle_input(input), do: input |> String.to_char_list |> increment |> _handle_input

  def _handle_input(input) do
    case valid_input(input) do
      true -> input
      false -> input |> increment |> _handle_input
    end
  end

  def valid_input(input), do: has_incrementing(input) and !contains_confusing_letters(input) and contains_multiple_pairs(input)

  def increment(input), do: input |> Enum.reverse |> _increment |> Enum.reverse
  def _increment([?z | tl]), do: [?a | _increment(tl)]
  def _increment([c | tl]), do: [c + 1 | tl]

  def has_incrementing([a, b, c | _tl]) when a+1 == b and b+1 == c, do: true
  def has_incrementing([_ | tl]), do: has_incrementing(tl)
  def has_incrementing([]), do: false

  def contains_confusing_letters([c | _tl]) when c in [?i,?o,?l], do: true
  def contains_confusing_letters([_ | tl]), do: contains_confusing_letters(tl)
  def contains_confusing_letters([]), do: false

  def contains_multiple_pairs(input), do: _contains_multiple_pairs(input, false)
  def _contains_multiple_pairs([a,a|_tl], true), do: true
  def _contains_multiple_pairs([a,a|tl], false), do: _contains_multiple_pairs(tl, true)
  def _contains_multiple_pairs([_|tl], found_one), do: _contains_multiple_pairs(tl, found_one)
  def _contains_multiple_pairs([], _), do: false

end