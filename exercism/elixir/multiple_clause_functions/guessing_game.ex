defmodule GuessingGame do

  def compare(secret_number, guess \\ nil)

  def compare(_secret_number, guess) when is_nil(guess) or guess === :no_guess, do: "Make a guess"

  def compare(secret_number, guess) when secret_number === guess, do: "Correct"

  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"

  def compare(secret_number, guess) when secret_number < guess, do: "Too high"

  def compare(secret_number, guess) when secret_number > guess, do: "Too low"

  def compare(secret_number, guess) when secret_number < guess, do: "Too High"
end

defmodule GuessingGame do

  def compare(secret_number, secret_number), do: "Correct"

  def compare(_, guess \\ :no_guess) when not is_integer(guess), do: "Make a guess"

  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"

  def compare(secret_number, guess) when secret_number < guess, do: "Too high"

  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
end
