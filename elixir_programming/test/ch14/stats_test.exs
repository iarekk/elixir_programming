defmodule Ch14.StatsTest do
  use ExUnit.Case

  doctest Ch14.Stats

  setup do
    [
      list: [1, 3, 5, 7, 9, 11],
      sum: 36,
      count: 6
    ]
  end

  describe "stats on lists of ints" do
    test "calculates sum", fixture do
      list = fixture.list
      assert Ch14.Stats.sum(list) == fixture.sum
    end

    test "calculates count", fixture do
      list = fixture.list
      assert Ch14.Stats.count(list) == fixture.count
    end

    test "calculates average", fixture do
      list = fixture.list
      assert Ch14.Stats.average(list) == fixture.sum / fixture.count
    end
  end
end
