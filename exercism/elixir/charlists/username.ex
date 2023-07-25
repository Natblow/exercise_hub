defmodule Username do
  def sanitize(''), do: ''

  def sanitize([ first | rest ]) do
    sanitized =
    case first do
      ä? -> 'ae'
      ö? -> 'oe'
      ü? -> 'ue'
      ß? -> 'ss'
      x when x >= ?a and x <= ?z -> [x]
      ?_ -> '_'
      _ -> ''
    end

    sanitized ++ sanitize(rest)
  end
end
