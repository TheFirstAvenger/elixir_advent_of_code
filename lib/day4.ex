defmodule AdventOfCode.Day4 do

  def handle_input(input), do: _handle_input(0, input, md5(0, input))

  def md5(a, b), do: Base.encode16(:crypto.hash(:md5, "#{b}#{a}"))

  def _handle_input(a, _, "00000" <> _), do: a
  def _handle_input(a, input, _), do: _handle_input(a+1, input, md5(a+1, input))
end