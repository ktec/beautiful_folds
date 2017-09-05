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

  # // Haskell version:
  # // data Fold i o = forall m . Monoid m => Fold (i -> m) (m -> o)
  #
  # // import Data.Monoid
  # // import Prelude hiding (sum)
  # //
  # // import qualified Data.Foldable
  # //
  # // data Fold i o = forall m . Monoid m => Fold (i -> m) (m -> o)
  # //
  # // fold :: Fold i o :: [i] -> o
  # // fold (Fold tally summarise) is = summarise ( reduce (map tally is) )
  # //   where
  # //     reduce = Data.Foldable.foldl' (<>) mempty
  # //
  # // sum :: Num n => Fold n n
  # // sum = Fold Sum getSum
  # //
  # //
  # // >>> fold sum [1..10]
  # // 55
  # //

  # fold sum [1..10]
  def example4() do
    getSum = fn(%Sum{value: x}) -> x end
    tally = &Sum.of/1
    sum = Fold.of(tally, getSum)
    IO.puts fold(sum, 1..10)
  end

  def example5(acc \\ [true, false, true]) do
    getResult = fn(%All{value: x}) -> x end
    tally = &All.of/1
    IO.puts fold(Fold.of(tally, getResult), acc)
  end

  def fold(%Fold{tally: tally, summarise: summarise}, is) do
    list = Enum.map(is, tally)
    empty = Monoid.mempty(List.first(list))

    func = fn
      (x, acc) ->
        # IO.puts "Element: #{inspect x}, Acc: #{inspect acc}"
        Monoid.mappend(acc, x)
    end
    reduce = Enum.reduce( list, empty, func )
    summarise.(reduce)
  end

  def example1(args \\ 1..1_000_000) do
    reducer = fn(x, acc) -> Sum.mappend(acc, Sum.of(x)) end

    args
    |> Enum.reduce(Sum.mempty(), reducer)
  end

  def example2(args \\ ["keith", "tanya"]) do
    reducer = fn(x, acc) -> Monoid.mappend(acc, MString.of(x)) end

    args
    |> Enum.reduce(MString.mempty(), reducer)
  end

  def example3(args \\ ["k", "e", "i", nil, nil]) do
    # Monoid.mappend(Maybe.of(MString.of("keith")), Maybe.of(MString.of("tanya")))
    # maybe string
    reducer = fn(x, acc) -> Monoid.mappend(acc, Maybe.of(MString.of(x))) end

    args
    |> Enum.reduce(Maybe.of(MString.mempty()), reducer)
  end
end
