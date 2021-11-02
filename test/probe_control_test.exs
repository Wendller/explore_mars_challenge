defmodule ProbeControlTest do
  use ExUnit.Case

  alias Probe
  alias ProbeControl

  describe "update_position/3" do
    setup do
      {:ok, probe1} = Probe.build({1, 1, "N"})
      {:ok, probe2} = Probe.build({1, 1, "E"})
      {:ok, probe3} = Probe.build({1, 1, "S"})
      {:ok, probe4} = Probe.build({1, 1, "W"})
      searching_area = {5, 5}

      {:ok, probe1: probe1, probe2: probe2, probe3: probe3, probe4: probe4, area: searching_area}
    end

    test "when a valid probe is passed, should move it one unit forward on Y axis", %{
      probe1: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "M", area)

      expected_response = %Probe{direction: "N", x: 1, y: 2}

      assert response == expected_response
    end

    test "when a valid probe is passed, should move it one unit forward on X axis", %{
      probe2: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "M", area)

      expected_response = %Probe{direction: "E", x: 2, y: 1}

      assert response == expected_response
    end

    test "when a valid probe is passed, should move it one unit backward on Y axis", %{
      probe3: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "M", area)

      expected_response = %Probe{direction: "S", x: 1, y: 0}

      assert response == expected_response
    end

    test "when a valid probe is passed, should move it one unit backward on X axis", %{
      probe4: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "M", area)

      expected_response = %Probe{direction: "W", x: 0, y: 1}

      assert response == expected_response
    end

    test "when a valid probe is passed, should rotate it to the left", %{
      probe1: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "L", area)

      expected_response = %Probe{direction: "W", x: 1, y: 1}

      assert response == expected_response
    end

    test "when a valid probe is passed, should rotate it to the right", %{
      probe1: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "R", area)

      expected_response = %Probe{direction: "E", x: 1, y: 1}

      assert response == expected_response
    end

    test "when the movement will pass the area limits, should return an error", %{
      probe1: probe,
      area: area
    } do
      response =
        ProbeControl.update_position(probe, "M", area)
        |> ProbeControl.update_position("M", area)
        |> ProbeControl.update_position("M", area)
        |> ProbeControl.update_position("M", area)
        |> ProbeControl.update_position("M", area)

      expected_response = {:error, "The probe can not pass the searching area limits"}

      assert response == expected_response
    end

    test "when an invalid movement is passed, should return an error", %{
      probe1: probe,
      area: area
    } do
      response = ProbeControl.update_position(probe, "Banana", area)

      expected_response = {:error, "This movement is not allowed"}

      assert response == expected_response
    end

    test "when an invalid param is passed, should return an error" do
      response = ProbeControl.update_position("Banana")

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
