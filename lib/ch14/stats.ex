defmodule Ch14.Stats do
  @doc """
  Sums a list of values

  ##Examples

    iex>Ch14.Stats.sum [1,2,3]
    6
  """
  def sum(vals), do: vals |> Enum.reduce(0, &+/2)
  def count(vals), do: vals |> length
  def average(vals), do: sum(vals)/count(vals)
end
