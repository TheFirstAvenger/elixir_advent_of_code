defmodule AdventOfCode.Day3 do

  def handle_input(input) do
    HashSet.new
    |> Set.put({0,0})
    |> _handle_input({0,0}, to_char_list(input))
    |> Set.size
  end

  def _handle_input(acc, _, []), do: acc
  def _handle_input(acc, {x,y}, [?> | tl]), do: _handle_input(Set.put(acc, {x+1, y}), {x+1, y}, tl)
  def _handle_input(acc, {x,y}, [?^ | tl]), do: _handle_input(Set.put(acc, {x, y+1}), {x, y+1}, tl)
  def _handle_input(acc, {x,y}, [?< | tl]), do: _handle_input(Set.put(acc, {x-1, y}), {x-1, y}, tl)
  def _handle_input(acc, {x,y}, [?v | tl]), do: _handle_input(Set.put(acc, {x, y-1}), {x, y-1}, tl)
end