defmodule AdventOfCode.Day17Test do
  use ExUnit.Case
  alias AdventOfCode.Day17

  test "final test" do
    assert 654 == Day17.handle_input("50
44
11
49
42
46
18
32
26
40
21
7
18
43
10
47
36
24
22
40")
  end
end
