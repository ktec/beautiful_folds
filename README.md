# BeautifulFolds

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `beautiful_folds` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:beautiful_folds, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/beautiful_folds](https://hexdocs.pm/beautiful_folds).

# Haskell Version
# import Data.Monoid
# import Prelude hiding (sum)
#
# import qualified Data.Foldable
#
# data Fold i o = forall m . Monoid m -> Fold (i -> m) (m -> o)
#
# fold :: Fold i o  -> [i] -> o
# fold (Fold tally summarize) is = summarize (reduce (map tally is))
#   where
#     reduce = Data.Foldable.foldl' (<>) mempty
#
# sum :: Num n -> Fold n n
# sum = Fold Sum getSum

# tally = fn(n) -> Monoid.new(n) end

# is = [1, 2, 3]
# map tally is = [Monoid(1), Monoid(2), Monoid(3)]


# >>> fold sum [1...10]
# 55

# >>> fold sum [(1::Int)..100_000_000]
# ...

# Elixir List.foldl/3

# List.foldl([5, 5], 10, fn(x, acc) -> x + acc end)
defmodule Fold do

  def fold(i, o) do

  end
end
