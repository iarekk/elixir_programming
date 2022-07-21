defmodule Ch14.StatsTest do
  use ExUnit.Case

  doctest Ch14.Stats

  test "calculates sum" do
    list = [1,3,5,7,9]
    assert Ch14.Stats.sum(list) == 25
  end
end
