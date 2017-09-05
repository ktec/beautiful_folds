# Sum Monoid

# const Sum = x =>
# ({
#   x,
#   mappend: ({x: y}) =>
#     Sum(x + y),
#   inspect: () =>
#     `Sum(${x})`
# })
#
# Sum.empty = () => Sum(0)

defmodule Sum do
  defstruct [:value]

  def of(x), do: %__MODULE__{value: x}

  defdelegate mappend(a, b), to: Monoid, as: :mappend
  def mempty(), do: Monoid.mempty(%__MODULE__{})
end

defimpl Monoid, for: Sum do
  def mappend(%Sum{value: x}, %Sum{value: y}) do
    Sum.of(x + y)
  end

  def mempty(_) do
    Sum.of(0)
  end
end
