defmodule Phoenix.HTML.SimplifiedHelpers.Truncate do

  def truncate(text, options \\ []) do
    len = options[:length] || 30
    IO.inspect len
    IO.inspect text
    text
  end

end
