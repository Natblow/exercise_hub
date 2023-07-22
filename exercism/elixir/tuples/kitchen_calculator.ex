defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(volume_pair) when elem(volume_pair, 0) === :cup do
    value = elem(volume_pair, 1) * 240
    {:milliliter, value}
  end

  def to_milliliter(volume_pair) when elem(volume_pair, 0) === :fluid_ounce do
    value = elem(volume_pair, 1) * 30
    {:milliliter, value}
  end

  def to_milliliter(volume_pair) when elem(volume_pair, 0) === :teaspoon do
    value = elem(volume_pair, 1) * 5
    {:milliliter, value}
  end

  def to_milliliter(volume_pair) when elem(volume_pair, 0) === :tablespoon do
    value = elem(volume_pair, 1) * 15
    {:milliliter, value}
  end

  def to_milliliter(volume_pair) when elem(volume_pair, 0) === :milliliter do
    value = elem(volume_pair, 1)
    {:milliliter, value}
  end

  def from_milliliter(volume_pair, unit) when unit === :cup do
    value = elem(volume_pair, 1) / 240
    { unit, value }
  end

  def from_milliliter(volume_pair, unit) when unit === :fluid_ounce do
    value = elem(volume_pair, 1) / 30
    { unit, value }
  end

  def from_milliliter(volume_pair, unit) when unit === :teaspoon do
    value = elem(volume_pair, 1) / 5
    { unit, value }
  end

  def from_milliliter(volume_pair, unit) when unit === :tablespoon do
    value = elem(volume_pair, 1) / 15
    { unit, value }
  end

  def from_milliliter(volume_pair, unit) when unit === :milliliter do
    value = elem(volume_pair, 1)
    { unit, value }
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end

# Cleaner solution

defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter({:cup, volume}) do
    value = volume * 240
    {:milliliter, value}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    value = volume * 30
    {:milliliter, value}
  end

  def to_milliliter({:teaspoon, volume}) do
    value = volume * 5
    {:milliliter, value}
  end

  def to_milliliter({:tablespoon, volume}) do
    value = volume * 15
    {:milliliter, value}
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end

  def from_milliliter({:milliliter, volume}, :cup) do
    value = volume / 240
    { :cup, value }
  end

  def from_milliliter({:milliliter, volume}, :fluid_ounce) do
    value = volume / 30
    { :fluid_ounce, value }
  end

  def from_milliliter({:milliliter, volume}, :teaspoon) do
    value = volume / 5
    { :teaspoon, value }
  end

  def from_milliliter({:milliliter, volume}, :tablespoon) do
    value = volume / 15
    { :tablespoon, value }
  end

  def from_milliliter({:milliliter, volume}, :milliliter) do
    { :milliliter, volume }
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end

# Other solution

defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume

  def to_milliliter({unit, volume}) do
    {:milliliter, volume * factor(unit)}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    {unit, volume / factor(unit)}
  end

  def convert({base_unit, volume}, unit) do
    {unit, volume * factor(base_unit) / factor(unit)}
  end

  defp factor(:cup), do: 240
  defp factor(:fluid_ounce), do: 30
  defp factor(:teaspoon), do: 5
  defp factor(:tablespoon), do: 15
  defp factor(:milliliter), do: 1
end
