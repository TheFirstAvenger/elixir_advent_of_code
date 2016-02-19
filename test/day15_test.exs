defmodule AdventOfCode.Day15Test do
  use ExUnit.Case
  alias AdventOfCode.Day15

  test "easy" do
    assert {[44, 56, 0, 0], 62842880} = Day15.handle_input("Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
A: capacity 0, durability 0, flavor 0, texture 0, calories 0
B: capacity 0, durability 0, flavor 0, texture 0, calories 0")
  end

  test "final test" do
    assert {[28, 35, 18, 19], 13882464} = Day15.handle_input("Sprinkles: capacity 5, durability -1, flavor 0, texture 0, calories 5
PeanutButter: capacity -1, durability 3, flavor 0, texture 0, calories 1
Frosting: capacity 0, durability -1, flavor 4, texture 0, calories 6
Sugar: capacity -1, durability 0, flavor 0, texture 2, calories 8")
  end
end
