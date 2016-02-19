defmodule AdventOfCode.Day4Test do
  use ExUnit.Case
  alias AdventOfCode.Day4

  test "easy" do
    assert Day4.handle_input("abcdef") == 609043
    assert Day4.handle_input("pqrstuv") == 1048970
  end

  test "final test" do
    assert 282749 == Day4.handle_input("yzbqklnj")
  end
end
