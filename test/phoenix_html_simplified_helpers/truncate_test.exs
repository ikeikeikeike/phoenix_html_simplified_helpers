Code.require_file("../../test_helper.exs", __ENV__.file)

defmodule Phoenix.HTML.SimplifiedHelpers.TruncateTest do
  use ExUnit.Case
  use Phoenix.HTML.SimplifiedHelpers

  doctest Phoenix.HTML.SimplifiedHelpers

  test "truncate" do
    assert "Once upon a time in a world..." ==
             truncate("Once upon a time in a world far far away")
  end

  test "truncate with length option" do
    assert "Once upon a ti..." == truncate("Once upon a time in a world far far away", length: 17)
  end

  test "truncate with omission option" do
    assert "And they f... (continued)" ==
             truncate(
               "And they found that many people were sleeping better.",
               length: 25,
               omission: "... (continued)"
             )
  end

  test "truncate no applying" do
    assert "Once upon a time in a world far far away" ==
             truncate("Once upon a time in a world far far away", length: 50)
  end

  test "truncate nil" do
    assert nil == truncate(nil)
  end

  test "truncate bool" do
    assert false == truncate(false)
  end

  test "truncate with separator option" do
    assert "Once upon a..." ==
             truncate("Once upon a time in a world far far away", length: 17, separator: " ")
  end

  test "truncate with separator option one" do
    assert "username@..." ==
             truncate("username@username-username.com", length: 20, separator: "user")
  end

  test "truncate with separator option two" do
    assert "username@username-..." ==
             truncate(
               "username@username-username.comusername@username-username.com",
               separator: "user"
             )
  end

  test "truncate with separator option three" do
    assert "..." ==
             truncate(
               "username@username-username.comusername@username-username.com",
               length: 3,
               separator: "user"
             )
  end

  # test "truncate with escape option" do
  # truncate "kjkjkjk"
  # assert 1 + 1 == 2
  # end
end
