defmodule AdventOfCode.Day20Test do

  use ExUnit.Case
  alias AdventOfCode.Day20

  test "easy" do
    assert Day20.calculate_house(1) == 10
    assert Day20.calculate_house(2) == 30
    assert Day20.calculate_house(3) == 40
    assert Day20.calculate_house(4) == 70
    assert Day20.calculate_house(5) == 60
    assert Day20.calculate_house(6) == 120
    assert Day20.calculate_house(7) == 80
    assert Day20.calculate_house(8) == 150
    assert Day20.calculate_house(9) == 130
  end

  @tag timeout: :infinity
  test "final test" do
    #Takes ~ 16 hrs to complete
    #assert Day20.handle_input(29000000) == 665280
  end
end
