defmodule Probe do
  @keys [:x, :y, :direction]
  @directions_allowed ["N", "E", "S", "W"]

  @enforce_keys @keys
  defstruct @keys

  def build({x, y, direction} = _params) when direction in @directions_allowed do
    case validate_initial_position({x, y}) do
      :ok ->
        {:ok,
         %__MODULE__{
           x: x,
           y: y,
           direction: direction
         }}

      error ->
        error
    end
  end

  def build({_x, _y, _direction}), do: {:error, "This direction is not allowed to the probe"}

  def build(_), do: {:error, "Invalid Parameters"}

  defp validate_initial_position({x, y}) do
    case {is_integer(x), is_integer(y)} do
      {true, true} -> :ok
      _ -> {:error, "Position x and y must be an integer"}
    end
  end
end
