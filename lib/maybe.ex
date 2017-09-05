defmodule Maybe do
  defstruct [:value]

  def of(nil), do: %__MODULE__{value: Nothing}
  def of(x), do: %__MODULE__{value: Just.of(x)}

  defdelegate mappend(a, b), to: Monoid, as: :mappend
  def mempty(), do: Monoid.mempty(%__MODULE__{})
end

defimpl Monoid, for: Maybe do
  # Just <> Just
  def mappend(%Maybe{value: %Just{} = x}, %Maybe{value: %Just{} = y}) do
    Maybe.of(Monoid.mappend(x, y))
  end

  # Just <> Nothing
  def mappend(%Maybe{value: x}, %Maybe{value: %Nothing{} = _}) do
    Maybe.of(x)
  end

  # Nothing <> Just
  def mappend(%Maybe{value: %Nothing{} = _}, %Maybe{value: y}) do
    Maybe.of(y)
  end

  # Nothing <> Nothing
  def mappend(%Maybe{value: %Nothing{} = x}, %Maybe{value: %Nothing{} = _y}) do
    Maybe.of(x)
  end

  def mempty(_) do
    Maybe.of(%Nothing{})
  end
end
