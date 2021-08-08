defmodule Mylist do
  def len([]), do: 0
  def len([_ | xs]), do: 1 + len(xs)

  def square([]), do: []
  def square([x | xs]), do: [x * x | square(xs)]

  def map([], _), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum(lst, f) do
    mapped = map(lst, f)
    reduce(mapped, 0, &(&1 + &2))
  end

  def max([head | tail]), do: _max(head, tail)

  defp _max(m, []), do: m
  defp _max(m, [h | t]) when h > m, do: _max(h, t)
  defp _max(m, [_ | t]), do: _max(m, t)

  def caesar(lst, shift), do: map(lst, &_rot(&1, shift))

  defp _rot(ltr, s) when ltr + s <= 122, do: ltr + s
  defp _rot(ltr, s), do: rem(ltr + s, 122) + 96
end

# (1..10) |> Enum.to_list |> Mylist.len
# Mylist.square(1..10 |> Enum.to_list)
# [a,b,c] = Mylist.map [4,5,6], fn (n) -> n*3 end
# Mylist.map [4,5,6], &(&1 * &1)
# Mylist.reduce [1,2,3], 100, &(&1 * &2)
# 10
IO.puts(Mylist.max([5, 4, 1, 2, 10, 3, 4, 7]))
IO.puts(Mylist.caesar('ryvkve', 13))
