defmodule Guards do
  def what_is(x) when is_number(x), do: "A number"
  def what_is(x) when is_atom(x), do: "An atom"
  def what_is(x) when is_list(x), do: "A list"
end
