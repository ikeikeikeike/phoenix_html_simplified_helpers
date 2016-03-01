defmodule Phoenix.HTML.SimplifiedHelpers do

  @doc false
  defmacro __using__(_options) do
    quote do
      import Phoenix.HTML.SimplifiedHelpers.Truncate
      import Phoenix.HTML.SimplifiedHelpers.TimeAgoInWords
      import Phoenix.HTML.SimplifiedHelpers.NumberWithDelimiter
    end
  end

end
