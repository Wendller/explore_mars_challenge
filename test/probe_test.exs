defmodule ProbeTest do
  use ExUnit.Case

  alias Probe

  describe "build/1" do
    test "when all params are valid, should return a probe struct" do
      probe_params = {1, 2, "N"}

      response = Probe.build(probe_params)
      expected_response = {:ok, %Probe{direction: "N", x: 1, y: 2}}

      assert response == expected_response
    end

    test "when an invalid direction is passed, should return an error" do
      probe_params = {1, 2, "X"}

      response = Probe.build(probe_params)
      expected_response = {:error, "This direction is not allowed to the probe"}

      assert response == expected_response
    end

    test "when an invalid position is passed, should return an error" do
      probe_params = {1, "banana", "E"}

      response = Probe.build(probe_params)
      expected_response = {:error, "Position x and y must be an integer"}

      assert response == expected_response
    end

    test "when a tuple is not passed, should return an error" do
      probe_params = "banana"

      response = Probe.build(probe_params)
      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
