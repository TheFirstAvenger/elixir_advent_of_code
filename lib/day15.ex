defmodule AdventOfCode.Day15 do

  def handle_input(input), do: input |> parse_values |> calculate_best

  def parse_values(input), do: input |> String.split("\n") |> Enum.map(&parse_line/1)

  def parse_line(line) do
    [name,_,capacity,_,durability,_,flavor,_,texture,_,calories] = String.split(line)
    {String.rstrip(name, ?:), int(String.rstrip(capacity, ?,)), int(String.rstrip(durability, ?,)), int(String.rstrip(flavor, ?,)), int(String.rstrip(texture, ?,)), int(String.rstrip(calories, ?,))}
  end

  def int(v), do: v |> Integer.parse |> elem(0)

  def permutations(sum), do: (for i <- 0..sum, j <- 0..(sum-i), k <- 0..(sum-i-j), l <- 0..(sum-i-j-k), i+j+k+l == sum, do: [i,j,k,l])

  def calculate_best(vals) do
    permutations(100)
    |> Enum.map(&calc_score(&1, vals))
    |> Enum.reduce(fn {_,next_score} = next, {_,best_score} = best ->
                    cond do
                      next_score > best_score -> next
                      true -> best
                    end
                   end)
  end

  def calc_score([count0, count1, count2, count3] = counts, [{_v0n,v0c,v0d,v0f,v0t,_},{_v1n,v1c,v1d,v1f,v1t,_},{_v2n,v2c,v2d,v2f,v2t,_},{_v3n,v3c,v3d,v3f,v3t,_}]) do
    {counts,
    max(0, (v0c * count0) + (v1c * count1) + (v2c * count2) + (v3c * count3)) *
    max(0, (v0d * count0) + (v1d * count1) + (v2d * count2) + (v3d * count3)) *
    max(0, (v0f * count0) + (v1f * count1) + (v2f * count2) + (v3f * count3)) *
    max(0, (v0t * count0) + (v1t * count1) + (v2t * count2) + (v3t * count3))}
  end

end