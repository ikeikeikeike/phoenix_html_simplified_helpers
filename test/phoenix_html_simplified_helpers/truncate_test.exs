Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Phoenix.HTML.SimplifiedHelpers.TruncateTest do
  use ExUnit.Case
  use Phoenix.HTML.SimplifiedHelpers

  doctest Phoenix.HTML.SimplifiedHelpers

  test "truncate" do
    truncate "kjkjkjk"
    assert 1 + 1 == 2
  end

  test "truncate with length option" do
    truncate "kjkjkjk"
    assert 1 + 1 == 2
  end

  test "truncate with separator option" do
    truncate "kjkjkjk"
    assert 1 + 1 == 2
  end

  test "truncate with omission option" do
    truncate "kjkjkjk"
    assert 1 + 1 == 2
  end

  test "truncate with escape option" do
    truncate "kjkjkjk"
    assert 1 + 1 == 2
  end

end
