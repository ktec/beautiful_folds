defmodule Just do
  defstruct [:value]

  def of(value), do: %__MODULE__{value: value}

  defdelegate mappend(a, b), to: Monoid, as: :mappend
  def mempty(), do: Monoid.mempty(%__MODULE__{})
end

defimpl Monoid, for: Just do
  def mappend(%Just{value: x}, %Just{value: y}) do
    Just.of(Monoid.mappend(x, y))
  end

  def mempty(_) do
    Maybe.of(0)
  end
end
