defmodule AdventOfCode.Day1 do

  def handle_input(input), do: _handle_input(0, to_char_list(input))

  def _handle_input(acc, []), do: acc
  def _handle_input(acc, [?( | tl]), do: _handle_input(acc + 1, tl)
  def _handle_input(acc, [?) | tl]), do: _handle_input(acc - 1, tl)

end