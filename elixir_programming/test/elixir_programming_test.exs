defmodule ElixirProgrammingTest do
  use ExUnit.Case
  doctest ElixirProgramming

  test "greets the world" do
    assert ElixirProgramming.hello() == :world
  end
end
