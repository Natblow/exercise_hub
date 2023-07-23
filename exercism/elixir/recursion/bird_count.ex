defmodule BirdCount do
  def today([]), do: nil
  def today([first | _rest]), do: first

  def increment_day_count([]), do: [1]

  def increment_day_count(list) do
    [ first | rest ] = list
    [ first + 1 | rest ]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _rest]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([ first | rest]), do: first + total(rest)

  def busy_days([]), do: 0
  def busy_days([ first | rest ]) when first >= 5, do: 1 + busy_days(rest)
  def busy_days([_first | rest]), do: busy_days(rest)
end
