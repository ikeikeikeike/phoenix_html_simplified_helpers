defmodule Phoenix.HTML.SimplifiedHelpers do

  @doc false
  defmacro __using__(_options) do
    quote do
      import Phoenix.HTML.SimplifiedHelpers.Truncate
    end
  end

end
