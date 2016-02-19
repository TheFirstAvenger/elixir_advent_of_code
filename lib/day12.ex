defmodule AdventOfCode.Day12 do

  def handle_input(input), do: input |> Poison.decode! |> _handle_input

  def _handle_input(a) when is_integer(a), do: a
  def _handle_input([hd|tl]), do: _handle_input(hd) + _handle_input(tl)
  def _handle_input(m) when is_map(m), do: _handle_input(Map.values(m))
  def _handle_input(_), do: 0


end