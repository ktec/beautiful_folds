defmodule BeautifulFolds do
  @moduledoc """
  Documentation for BeautifulFolds.
  """

  @doc """
  Hello world.

  ## Examples

      iex> BeautifulFolds.hello
      :world

  """
  def hello do
    :world
  end

  1..1000_000 |> Enum.reduce(Sum.mempty(), fn(x, acc) -> Sum.concat(acc, Sum.of(x)) end)

end
