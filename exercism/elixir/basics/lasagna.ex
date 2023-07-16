defmodule Lasagna do
  @expected_min 40
  @min_per_layer 2

  def expected_minutes_in_oven, do: @expected_min

  def remaining_minutes_in_oven(current_min), do: expected_minutes_in_oven() - current_min

  def preparation_time_in_minutes(layers), do: layers * @min_per_layer

  def total_time_in_minutes(layers, current_min), do: preparation_time_in_minutes(layers) + current_min

  def alarm, do: "Ding!"
end
