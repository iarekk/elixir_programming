defmodule Times do
  def double(n) do
    n * 2
  end

  def dva(n), do: n * 2

  def quadruple(n) do
    n |> double |> double
  end
end
