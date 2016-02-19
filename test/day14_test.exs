defmodule AdventOfCode.Day14Test do
  use ExUnit.Case
  alias AdventOfCode.Day14

  test "easy" do
    comet = Day14.parse_line("Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.")
    dancer = Day14.parse_line("Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.")
    assert Day14.calculate_distance(comet, 1) == 14
    assert Day14.calculate_distance(dancer, 1) == 16
    assert Day14.calculate_distance(comet, 10) == 140
    assert Day14.calculate_distance(dancer, 10) == 160
    assert Day14.calculate_distance(comet, 11) == 140
    assert Day14.calculate_distance(dancer, 11) == 176
    assert Day14.calculate_distance(comet, 1000) == 1120
    assert Day14.calculate_distance(dancer, 1000) == 1056
    assert {"Comet", 1120} = Day14.handle_input("Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.",1000)
  end

  test "final test" do
    assert {"Donner", 2655} = Day14.handle_input("Vixen can fly 8 km/s for 8 seconds, but then must rest for 53 seconds.
Blitzen can fly 13 km/s for 4 seconds, but then must rest for 49 seconds.
Rudolph can fly 20 km/s for 7 seconds, but then must rest for 132 seconds.
Cupid can fly 12 km/s for 4 seconds, but then must rest for 43 seconds.
Donner can fly 9 km/s for 5 seconds, but then must rest for 38 seconds.
Dasher can fly 10 km/s for 4 seconds, but then must rest for 37 seconds.
Comet can fly 3 km/s for 37 seconds, but then must rest for 76 seconds.
Prancer can fly 9 km/s for 12 seconds, but then must rest for 97 seconds.
Dancer can fly 37 km/s for 1 seconds, but then must rest for 36 seconds.", 2503)
  end
end
