defmodule ExploreMarsTest do
  use ExUnit.Case

  alias ExploreMars

  describe "init/3" do
    setup do
      searching_area = {5, 5}
      probe_params = {1, 2, "N"}
      movements = ["L", "M", "L", "M", "L", "M", "L", "M", "M"]

      {:ok, searching_area: searching_area, probe_params: probe_params, movements: movements}
    end

    test "when all params are valid, should return a probe with its final position", %{
      searching_area: searching_area,
      probe_params: probe_params,
      movements: movements
    } do
      response = ExploreMars.init(searching_area, probe_params, movements)

      expected_response = %Probe{direction: "N", x: 1, y: 3}

      assert response == expected_response
    end

    test "when searching area values are not valid, should return an error", %{
      probe_params: probe_params,
      movements: movements
    } do
      response = ExploreMars.init({"banana", "laranja"}, probe_params, movements)

      expected_response = {:error, "Searching area must be a tuple of integers"}

      assert response == expected_response
    end

    test "when searching area values are not passed in a tuple, should return an error", %{
      probe_params: probe_params,
      movements: movements
    } do
      response = ExploreMars.init([1, 1], probe_params, movements)

      expected_response = {:error, "Searching area values must be passed in a tuple"}

      assert response == expected_response
    end
  end
end
