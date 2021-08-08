defmodule Fact do
  def of(0), do: 1
  def of(n), do: n * of(n-1)

  def safeof(0), do: 1
  def safeof(n) when is_integer(n) and n > 0, do: n * safeof(n-1)
end
