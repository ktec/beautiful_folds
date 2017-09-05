# const All = x =>
# ({
#   x,
#   mappend: ({x: y}) =>
#     All(x && y),
#   inspect: () =>
#     `All(${x})`
# })
#
# All.empty = () => All(true)

defmodule All do
  defstruct [:value]

  def of(x), do: %__MODULE__{value: x}

  defdelegate mappend(a, b), to: Monoid, as: :mappend
  def mempty, do: Monoid.mempty(__MODULE__)
end

defimpl Monoid, for: All do
  def mappend(%All{value: x}, %All{value: y}) do
    All.of(x && y)
  end

  def mempty(%All{}) do
    All.of(true)
  end
end
