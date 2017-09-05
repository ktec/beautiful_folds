defmodule MString do
  defstruct [:value]

  def of(x), do: %__MODULE__{value: x}

  defdelegate mappend(a, b), to: Monoid, as: :mappend
  def mempty(), do: Monoid.mempty(%__MODULE__{})
end

defimpl Monoid, for: MString do
  def mappend(%MString{value: x}, %MString{value: y}) do
    MString.of(x <> y)
  end

  def mempty(%MString{}) do
    MString.of("")
  end
end
