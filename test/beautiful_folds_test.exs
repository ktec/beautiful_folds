defmodule BeautifulFoldsTest do
  use ExUnit.Case
  doctest BeautifulFolds

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "flat_map_fold supports enumerable list" do
    fun = fn
      n, acc when n < 3 -> {[n], acc + n}
      _n, acc -> {:halt, acc}
    end

    result = 1..10 |> Enum.flat_map_reduce(0, fun)
    assert result == {[1, 2], 3}
  end

  test "flat_map_fold returns keiths" do
    fun = fn
      n, acc when n < 3 -> {[:keith], acc + n}
      _n, acc -> {:halt, acc}
    end

    result = 1..10 |> Enum.flat_map_reduce(0, fun)
    assert result == {[:keith, :keith], 3}
  end
end
