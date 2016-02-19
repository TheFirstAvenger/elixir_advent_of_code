defmodule AdventOfCode.Day11Test do
  use ExUnit.Case
  alias AdventOfCode.Day11

  test "easy" do
    assert Day11.has_incrementing('hijklmmn')
    assert Day11.contains_confusing_letters('hijklmmn')

    refute Day11.has_incrementing('abbceffg')
    assert Day11.contains_multiple_pairs('abbceffg')

    refute Day11.contains_multiple_pairs('abbcegjk')

    assert Day11.handle_input("abcdefgh") == 'abcdffaa'
    assert Day11.handle_input("ghijklmn") == 'ghjaabcc'
  end

  test "final test" do
    assert Day11.handle_input("hxbxwxba") == 'hxbxxyzz'
  end
end
