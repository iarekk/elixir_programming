defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true

  def print_sub(s) when s.name == "", do: IO.puts("NO NAME")

  def print_sub(s = %Subscriber{over_18: true}) do
    IO.puts("Full subscriber #{s.name}, paid: #{s.paid}")
  end

  def print_sub(s) do
    IO.puts("Junior subscriber #{s.name}, paid: #{s.paid}")
  end
end

s = %Subscriber{}
# %Subscriber{name: "", over_18: true, paid: false}

IO.inspect(s)

s1 = %Subscriber{:name => "Maria"}
%Subscriber{name: "Maria", over_18: true, paid: false}

IO.inspect(s1)
IO.inspect(s1.name)

s2 = %Subscriber{s1 | :paid => true}

IO.inspect(s2)
# error
# s = %Subscriber{:forename => "Maria"}
