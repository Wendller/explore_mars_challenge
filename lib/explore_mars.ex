defmodule ExploreMars do
  alias Mission
  alias Probe

  def init(searching_area, params, movements) do
    with {:ok, %Probe{} = probe} <- Probe.build(params),
         :ok <- validate_searching_area(searching_area) do
      Mission.start(probe, movements, searching_area)
    else
      error -> error
    end
  end

  defp validate_searching_area({xLimit, yLimit}) do
    case {is_integer(xLimit), is_integer(yLimit)} do
      {true, true} -> :ok
      _ -> {:error, "Searching area must be a tuple of integers"}
    end
  end

  defp validate_searching_area(_), do: {:error, "Searching area values must be passed in a tuple"}
end

# ExploreMars.init({5, 5}, {1, 2, "N"}, ["L", "M", "L", "M", "L", "M", "L", "M", "M"])
# ExploreMars.init({5, 5}, {3, 3, "E"}, ["M", "M", "R", "M", "M", "R", "M", "R", "R", "M"])
