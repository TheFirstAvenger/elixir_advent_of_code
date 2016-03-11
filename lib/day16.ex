defmodule AdventOfCode.Day16 do

  def handle_input(input1, input2), do: input1 |> parse_aunts |> calculate_answer(parse_mfcsam(input2))

  def parse_aunts(input), do: input |> String.split("\n") |> Enum.map(&parse_aunt_line/1) |> compile_aunts_values

  def parse_aunt_line(line) do
    [_,number,item1,count1,item2,count2,item3,count3] = String.split(line)
    {String.rstrip(number, ?:), String.rstrip(item1, ?:), int(String.rstrip(count1, ?,)), String.rstrip(item2, ?:), int(String.rstrip(count2, ?,)), String.rstrip(item3, ?:), int(count3)}
  end

  def compile_aunts_values(list) do
    Enum.reduce(list, %{}, fn {num, i1, c1, i2, c2, i3, c3}, acc ->
                                    acc
                                    |> Map.put("#{num}:#{i1}", c1)
                                    |> Map.put("#{num}:#{i2}", c2)
                                    |> Map.put("#{num}:#{i3}", c3)
                                   end)
  end

  def parse_mfcsam(mfcsam), do: mfcsam |> String.split("\n") |> Enum.map(&parse_mfcsam_line/1)

  def parse_mfcsam_line(line) do
    [item,count] = String.split(line)
    {String.rstrip(item, ?:), int(count)}
  end

  def int(v), do: v |> Integer.parse |> elem(0)

  def calculate_answer(aunts, mfcsam), do: _calculate_answer(Enum.to_list(1..500), aunts, mfcsam)

  def _calculate_answer([],_,_), do: raise "No aunt found matching mfcsam output"
  def _calculate_answer([h|t], aunts, mfcsam) do
    cond do
      check_aunt(h, aunts, mfcsam) -> h
      true -> _calculate_answer(t, aunts, mfcsam)
    end
  end

  def check_aunt(i, aunts, mfcsam), do: check_mfcsam(mfcsam, i, aunts)

  def check_mfcsam([],_,_), do: true
  def check_mfcsam([{hi,hc}|t], i, aunts) do
    case Map.get(aunts, "#{i}:#{hi}") do
      ^hc -> check_mfcsam(t, i, aunts)
      nil -> check_mfcsam(t, i, aunts)
      _   -> false
    end
  end

end