Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Phoenix.HTML.SimplifiedHelpers.TruncateTest do
  use ExUnit.Case
  use Phoenix.HTML.SimplifiedHelpers

  doctest Phoenix.HTML.SimplifiedHelpers

  test "truncate" do
    assert "Once upon a time in a world..." == truncate("Once upon a time in a world far far away")
  end

  test "truncate with length option" do
    assert "Once upon a time in a wo..." == truncate("Once upon a time in a world far far away", length: 27)
  end

  test "truncate with omission option" do
    assert "And they f... (continued)" == truncate("And they found that many people were sleeping better.", length: 25, omission: "... (continued)")
  end

  # test "truncate with separator option" do
    # assert "Once upon a time in a..." == truncate("Once upon a time in a world far far away", length: 27, separator: " ")
  # end

  # test "truncate with escape option" do
    # truncate "kjkjkjk"
    # assert 1 + 1 == 2
  # end

end
