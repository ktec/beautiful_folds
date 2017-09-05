defmodule Nothing do
  defstruct []

  def of(nil), do: %__MODULE__{}

  defdelegate mappend(a, b), to: Monoid, as: :mappend
  def mempty(), do: Monoid.mempty(%__MODULE__{})
end

defimpl Monoid, for: Nothing do
  def mappend(%Nothing{}, %Nothing{}) do
    Nothing.of(nil)
  end

  def mempty(%Nothing{}) do
    Nothing.of(nil)
  end
end
