defmodule AdventOfCode.Day18_2 do

  def handle_input(input), do: input |> parse_input |> calculate_answer

  def parse_input(input), do: input |> String.split("\n") |> _parse_lines(1)

  def _parse_lines(_lines, 101), do: HashSet.new
  def _parse_lines(lines, i), do: lines |> Enum.at(i-1) |> parse_line(i) |> Set.union(_parse_lines(lines, i+1))

  def parse_line(line, line_num), do: line |> String.to_char_list |> _parse_line(1, line_num)
  def _parse_line([],_,_), do: HashSet.new
  def _parse_line([h|t], i, line_num) when h == ?#, do: Set.put(_parse_line(t, i+1, line_num), {line_num, i})
  def _parse_line([_|t], i, line_num), do: _parse_line(t, i+1, line_num)

  def calculate_answer(lights), do: _handle_iteration(lights, 100) |> Set.size

  def _handle_iteration(lights, 0), do: lights |> set_broken_lights
  def _handle_iteration(lights, count), do: lights |> set_broken_lights |> _handle_light(1, 1) |> _handle_iteration(count - 1)

  def _handle_light(_,101,_), do: HashSet.new
  def _handle_light(original, x, 101), do: _handle_light(original, x+1, 1)
  def _handle_light(original, x, y) do
    neighbors_on =
    [light_on(original,x-1,y-1),
     light_on(original,x-1,y),
     light_on(original,x-1,y+1),
     light_on(original,x,y-1),
     light_on(original,x,y+1),
     light_on(original,x+1,y-1),
     light_on(original,x+1,y),
     light_on(original,x+1,y+1)]
     |> Enum.filter(fn on -> on end)
     |> Enum.count
    case {light_on(original,x, y), neighbors_on} do
      {true, n} when n in [2,3] -> Set.put(_handle_light(original, x, y+1), {x, y})
      {false, 3}                -> Set.put(_handle_light(original, x, y+1), {x, y})
      _                         -> _handle_light(original, x, y+1)
    end
  end

  def set_broken_lights(lights), do: lights |> Set.put({1,1}) |> Set.put({100,1}) |> Set.put({1,100}) |> Set.put({100,100})

  def light_on(_, 1, 1), do: true
  def light_on(_, 1, 100), do: true
  def light_on(_, 100, 1), do: true
  def light_on(_, 100, 100), do: true
  def light_on(lights, x, y), do: Set.member?(lights, {x,y})

end