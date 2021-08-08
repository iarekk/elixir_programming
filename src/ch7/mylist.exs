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

  def dumbEven([]), do: true
  def dumbEven([_, _ | tail]), do: dumbEven(tail)
  def dumbEven([_]), do: false

  def test_data do
    [
      [1_366_225_622, 26, 15, 0.125],
      [1_366_225_622, 27, 15, 0.45],
      [1_366_225_622, 28, 21, 0.25],
      [1_366_229_222, 26, 19, 0.081],
      [1_366_229_222, 27, 17, 0.468],
      [1_366_229_222, 28, 15, 0.60],
      [1_366_232_822, 26, 22, 0.095],
      [1_366_232_822, 27, 21, 0.05],
      [1_366_232_822, 28, 24, 0.03],
      [1_366_236_422, 26, 17, 0.025]
    ]
  end

  def for_location_27([]), do: []

  def for_location_27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end

  def for_location_27([_ | tail]), do: for_location_27(tail)

  def for_location([], _), do: []
  def for_location([head = [_, loc, _, _] | tail], loc), do: [head | for_location(tail, loc)]
  def for_location([_ | tail], loc), do: for_location(tail, loc)

  def span(from, to) when from <= to, do: [from | span(from + 1, to)]
  def span(_, _), do: []
end

IO.inspect(1..10 |> Enum.to_list() |> Mylist.len())
IO.inspect(Mylist.square(1..10 |> Enum.to_list()))
IO.inspect(Mylist.map([4, 5, 6], fn n -> n * 3 end))
IO.inspect(Mylist.map([4, 5, 6], &(&1 * 30)))
IO.inspect(Mylist.reduce([1, 2, 3], 100, &(&1 * &2)))
IO.inspect(Mylist.max([5, 4, 1, 2, 10, 3, 4, 7]))
IO.inspect(Mylist.caesar('ryvkve', 13))
IO.inspect(Mylist.dumbEven([1, 2, 3, 4]))
IO.inspect(Mylist.for_location(Mylist.test_data(), 26))
IO.inspect(Mylist.span(3, 15))
