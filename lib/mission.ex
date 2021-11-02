defmodule Mission do
  alias Probe
  alias ProbeControl

  def start(%Probe{} = probe, [first_movement | movements_remaining], searching_area) do
    probe
    |> ProbeControl.update_position(first_movement, searching_area)
    |> start(movements_remaining, searching_area)
  end

  def start(%Probe{} = probe, [], _searching_area), do: probe

  def start({:error, _reason} = error, _movements, _searching_area), do: error
end
