# defmodule Any do
#   defstruct [:value]
#
#   def of(x), do: %__MODULE__{value: x}
#
#   defdelegate mappend(a, b), to: Monoid, as: :mappend
#   def mempty, do: Monoid.mempty(__MODULE__)
# end
#
# defimpl Monoid, for: Any do
#   def mappend(%All{value: x}, %All{value: y}) do
#     Any.of(x || y)
#   end
#
#   def mempty(%Any{}) do
#     Any.of(false)
#   end
# end
