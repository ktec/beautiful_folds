# Monoid = concat + mempty


# Sum Monoid

# const Sum = x =>
# ({
#   x,
#   concat: ({x: y}) =>
#     Sum(x + y),
#   inspect: () =>
#     `Sum(${x})`
# })
#
# Sum.empty = () => Sum(0)

defmodule Sum do
  defstruct [:x]

  def of(x), do: %__MODULE__{x: x}

  defdelegate concat(a, b), to: Monoid, as: :concat
  def mempty(), do: Monoid.mempty(%__MODULE__{})
end

# const All = x =>
# ({
#   x,
#   concat: ({x: y}) =>
#     All(x && y),
#   inspect: () =>
#     `All(${x})`
# })
#
# All.empty = () => All(true)

defmodule All do
  defstruct [:x]

  def of(x), do: %__MODULE__{x: x}

  defdelegate concat(a, b), to: Monoid, as: :concat
  def mempty, do: Monoid.empty(__MODULE__)
end


defprotocol Monoid do
  @spec concat(Monoid.t, Monoid.t) :: Monoid.t
  def concat(a, b)

  @spec mempty(Monoid.t) :: Monoid.t
  def mempty(a)
end

defimpl Monoid, for: Sum do
  def concat(%Sum{x: x}, %Sum{x: y}) do
    Sum.of(x + y)
  end

  def mempty(_) do
    Sum.of(0)
  end
end

defimpl Monoid, for: All do
  def concat(%All{x: x}, %All{x: y}) do
    All.of(x && y)
  end

  def mempty(%All{}) do
    All.of(0)
  end
end
