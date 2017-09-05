# Fold

defmodule Fold do
  defstruct [:tally, :summarise]

  def of(tally, summarise) do
    %__MODULE__{tally: tally, summarise: summarise}
  end
end
