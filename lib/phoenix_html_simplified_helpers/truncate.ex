defmodule Phoenix.HTML.SimplifiedHelpers.Truncate do

  def truncate(text, options \\ []) do
    len = options[:length] || 30
    omi = options[:omission] || "..."

    cond do
     !String.valid?(text)       -> text
      String.length(text) < len -> text
      true ->
        len_with_omi = len - String.length(omi)
        stop =
          if options[:separator] do
            rindex(text, options[:separator], len_with_omi) || len_with_omi
          else
            len_with_omi
          end

        "#{String.slice(text, 0, stop)}#{omi}"
    end
  end

  defp rindex(text, str, offset \\ nil) do
    text =
      if offset do
        String.slice(text, 0, offset)
      else
        text
      end

    revesed = text |> String.reverse
    matchword = String.reverse(str)

    case :binary.match(revesed, matchword) do
      {at, strlen} ->
        String.length(text) - at - strlen
      :nomatch     ->
        nil
    end
  end

end
