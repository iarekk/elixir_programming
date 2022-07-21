defmodule Ch14.StatsTest do
  use ExUnit.Case

  doctest Ch14.Stats

  describe "stats on lists of ints" do
    test "calculates sum" do
      list = [1, 3, 5, 7, 9]
      assert Ch14.Stats.sum(list) == 25
    end

    test "calculates count" do
      list = [1, 3, 5, 7, 9]
      assert Ch14.Stats.count(list) == 5
    end

    test "calculates average" do
      list = [1, 3, 5, 7, 9]
      assert Ch14.Stats.average(list) == 5
    end
  end
end
