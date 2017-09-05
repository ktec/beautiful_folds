# Monoid = mappend + mempty

# defmodule Monoid do
#   defstruct [:value]
#
#   def mappend(a, b) do
#     a + b
#   end
#   def mempty() do
#     ""
#   end
# end

defprotocol Monoid do
  @spec mappend(Monoid.t, Monoid.t) :: Monoid.t
  def mappend(a, b)

  @spec mempty(Monoid.t) :: Monoid.t
  def mempty(a)
end

defimpl Monoid, for: List do
  def mappend(a, b) do
    a ++ b
  end

  def mempty(_) do
    []
  end
end

defimpl Monoid, for: Range do
  def mappend(x, y) do
    a.._b = x
    _c..d = y
    a..d
  end

  def mempty(_) do
    0..0
  end
end
