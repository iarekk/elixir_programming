defmodule Ch14.StatsPropertyBasedTest do
  use ExUnit.Case
  use ExUnitProperties

  describe "stats on lists of ints" do
    property "single element lists are their own sum" do
      check all(number <- integer()) do
        assert Ch14.Stats.sum([number]) == number
      end
    end

    property "single element lists are their own average" do
      check all(number <- integer()) do
        assert Ch14.Stats.average([number]) == number
      end
    end

    property "single element lists have count of one" do
      check all(number <- integer()) do
        assert Ch14.Stats.count([number]) == 1
      end
    end

    property "count not negative" do
      check all(list <- list_of(integer())) do
        assert Ch14.Stats.count(list) >= 0
      end
    end

    property "sum equals average times count" do
      check all(list <- list_of(integer()) |> nonempty) do
        avg = Ch14.Stats.average(list)
        cnt = Ch14.Stats.count(list)
        sum = Ch14.Stats.sum(list)

        assert_in_delta(sum, avg * cnt, 1.0e-6)
      end
    end
  end
end
