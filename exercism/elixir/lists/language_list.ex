defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [ language | list ]

  def remove(list), do: tl(list)

  def first(list), do: hd(list)

  def count(list), do: length(list)

  def functional_list?(list), do: "Elixir" in list
end

# Other solution:

defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [ language | list ]

  def remove([_ | list]), do: list

  def first([list | _]), do: list

  def count(list), do: length(list)

  def functional_list?(list), do: "Elixir" in list
end
