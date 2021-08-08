defmodule Mylist do
  def len([]), do: 0
  def len([_ | xs]), do: 1 + len(xs)

  def square([]), do: []
  def square([x | xs]), do: [x*x | square(xs)]

  def map([], _), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _), do: value
  def reduce([head|tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum(lst, f) do
    mapped = map(lst, f)
    reduce(mapped, 0, &(&1 + &2))
  end
end

# (1..10) |> Enum.to_list |> Mylist.len
# Mylist.square(1..10 |> Enum.to_list)
# [a,b,c] = Mylist.map [4,5,6], fn (n) -> n*3 end
# Mylist.map [4,5,6], &(&1 * &1)
# Mylist.reduce [1,2,3], 100, &(&1 * &2)
