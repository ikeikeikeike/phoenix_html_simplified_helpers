Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Phoenix.HTML.SimplifiedHelpers.NumberWithDelimiterTest do
  use ExUnit.Case
  use Phoenix.HTML.SimplifiedHelpers

  doctest Phoenix.HTML.SimplifiedHelpers

  test "int into number_with_delimiter" do
    assert number_with_delimiter(1234567)   == "1,234,567"
  end

  test "string into number_with_delimiter" do
    assert number_with_delimiter("1234567") == "1,234,567"
  end
end
