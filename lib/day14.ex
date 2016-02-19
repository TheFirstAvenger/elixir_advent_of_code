defmodule AdventOfCode.Day14 do

  def handle_input(input, duration), do: input |> parse_values |> calculate_best(duration)

  def parse_values(input), do: input |> String.split("\n") |> Enum.map(&parse_line/1)

  def parse_line(line) do
    [name,_,_,speed,_,_,speed_dur,_,_,_,_,_,_,rest_dur,_] = String.split(line)
    {name, int(speed), int(speed_dur), int(rest_dur)}
  end

  def int(v), do: v |> Integer.parse |> elem(0)

  def calculate_best(list, duration) do
    list
    |> Enum.map(fn {name,_,_,_} = vals -> {name, calculate_distance(vals, duration)} end)
    |> Enum.reduce(fn {next_name, next_distance}, {best_name, best_distance} ->
                    cond do
                      next_distance > best_distance -> {next_name, next_distance}
                      true -> {best_name, best_distance}
                    end
                  end)
  end

  def calculate_distance({_,_,speed_dur,_} = vals, duration), do: _calculate_distance(vals, 0, speed_dur, true, duration)
  def _calculate_distance(_,curr_dist,_,_,0), do: curr_dist
  def _calculate_distance({_,_,_,rest_dur} = vals, curr_dist, 0, true, remaining_total), do: _calculate_distance(vals, curr_dist, rest_dur, false, remaining_total)
  def _calculate_distance({_,_,speed_dur,_} = vals, curr_dist, 0, false, remaining_total), do: _calculate_distance(vals, curr_dist, speed_dur, true, remaining_total)
  def _calculate_distance({_,speed,_,_} = vals, curr_dist, remaining_current, true, remaining_total), do: _calculate_distance(vals, curr_dist + speed, remaining_current - 1, true, remaining_total - 1)
  def _calculate_distance(vals, curr_dist, remaining_current, false, remaining_total), do: _calculate_distance(vals, curr_dist, remaining_current - 1, false, remaining_total - 1)

end