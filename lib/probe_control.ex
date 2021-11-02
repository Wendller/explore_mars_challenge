defmodule ProbeControl do
  @directions_allowed ["N", "E", "S", "W", "N", "E", "S", "W"]
  @movements_allowed ["L", "R", "M"]

  def update_position(%Probe{} = probe, movement, searching_area)
      when movement in @movements_allowed do
    cond do
      movement == "M" -> move_probe_forward(probe, searching_area)
      movement in ["L", "R"] -> rotate_probe(probe, movement)
    end
  end

  def update_position(%Probe{}, _movement, _searching_area),
    do: {:error, "This movement is not allowed"}

  def update_position(_), do: {:error, "Invalid Parameters"}

  defp move_probe_forward(
         %Probe{x: x, y: y, direction: current_direction} = probe,
         {x_limit, y_limit}
       ) do
    cond do
      current_direction == "N" and y + 1 <= y_limit -> Map.put(probe, :y, y + 1)
      current_direction == "E" and x + 1 <= x_limit -> Map.put(probe, :x, x + 1)
      current_direction == "S" and y - 1 >= 0 -> Map.put(probe, :y, y - 1)
      current_direction == "W" and x - 1 >= 0 -> Map.put(probe, :x, x - 1)
      true -> {:error, "The probe can not pass the searching area limits"}
    end
  end

  defp rotate_probe(%Probe{direction: current_direction} = probe, movement) do
    current_direction_index =
      Enum.find_index(@directions_allowed, fn direction_allowed ->
        direction_allowed == current_direction
      end)

    if movement == "L" do
      {:ok, next_direction} = Enum.fetch(@directions_allowed, current_direction_index - 1)
      Map.put(probe, :direction, next_direction)
    else
      {:ok, next_direction} = Enum.fetch(@directions_allowed, current_direction_index + 1)
      Map.put(probe, :direction, next_direction)
    end
  end
end
