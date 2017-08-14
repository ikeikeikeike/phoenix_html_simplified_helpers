defmodule Phoenix.HTML.SimplifiedHelpers.NumberWithDelimiter do

  def number_with_delimiter(i) when is_binary(i), do: number_with_delimiter String.to_integer(i)
  def number_with_delimiter(i) when is_integer(i) do
    i
    |> Integer.to_charlist
    |> Enum.reverse
    |> Enum.chunk(3, 3, [])
    |> Enum.join(",")
    |> String.reverse
  end

end
