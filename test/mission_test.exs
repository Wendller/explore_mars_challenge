defmodule MissionTest do
  use ExUnit.Case

  alias Mission

  describe "start/3" do
    setup do
      searching_area = {5, 5}
      probe_params = {1, 2, "N"}
      movements = ["L", "M", "L", "M", "L", "M", "L", "M", "M"]

      {:ok, searching_area: searching_area, probe_params: probe_params, movements: movements}
    end

    test "when an erro is passed instead a probe, should return this error", %{
      searching_area: searching_area,
      movements: movements
    } do
      response = Mission.start({:error, "there is some error"}, movements, searching_area)

      assert response == {:error, "there is some error"}
    end
  end
end
