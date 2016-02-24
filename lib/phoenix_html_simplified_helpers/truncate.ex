defmodule Phoenix.HTML.SimplifiedHelpers.Truncate do

  def truncate(text, options \\ []) do
    len = options[:length] || 30
    omi = options[:omission] || "..."

    len_with_omi = len - String.length(omi)
    stop =
      if options[:separator] do
        rindex(text, options[:separator], len_with_omi) || len_with_omi
      else
        len_with_omi
      end

    "#{String.slice(text, 0, stop)}#{omi}"
  end

  def rindex(text, str), do: rindex(text, str, 0)
  def rindex(text, str, offset) do
    {index, _} =
      String.slice(String.reverse(text), offset, String.length(text))
      |> :binary.match(str)

    String.length(text) - 1 - index - offset
  end

end
