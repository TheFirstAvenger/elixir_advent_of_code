defmodule AdventOfCode.Day5 do

  def handle_input(input) do
    input
    |> String.split
    |> Enum.filter(&naughty_or_nice(&1) == :nice)
    |> Enum.count
  end

  def naughty_or_nice(input) do
    icl = to_char_list input
    case {has_3_vowels(icl), repeated_letter(icl), !bad_sequence(icl)} do
      {true, true, true} -> :nice
      _                  -> :naughty
    end
  end

  def has_3_vowels(input), do: _has_3_vowels(0, input)
  defp _has_3_vowels(3,_), do: true
  defp _has_3_vowels(_,[]), do: false
  defp _has_3_vowels(x,[v|t]) when v in [?a,?e,?i,?o,?u], do: _has_3_vowels(x+1, t)
  defp _has_3_vowels(x,[_c|t]), do: _has_3_vowels(x, t)

  def repeated_letter([]), do: false
  def repeated_letter([_]), do: false
  def repeated_letter([a,a|_]), do: true
  def repeated_letter([_|t]), do: repeated_letter(t)

  def bad_sequence([a,b|_]) when {a,b} in [{?a,?b}, {?c,?d}, {?p,?q}, {?x,?y}], do: true
  def bad_sequence([]), do: false
  def bad_sequence([_]), do: false
  def bad_sequence([_|t]), do: bad_sequence(t)

end