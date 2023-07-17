defmodule FreelancerRates do
  @hours 8.0
  @month_bills_amount 22

  def daily_rate(hourly_rate), do: @hours * hourly_rate

  def apply_discount(before_discount, discount), do: before_discount - (before_discount * discount / 100)

  def monthly_rate(hourly_rate, discount) do
    @month_bills_amount * hourly_rate
    |> daily_rate
    |> apply_discount(discount)
    |> Kernel.ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_rate = hourly_rate
    |> daily_rate
    |> apply_discount(discount)

    days = budget / discounted_rate
    |> Float.floor(1)

    days
  end
end
