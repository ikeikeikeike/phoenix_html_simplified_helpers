Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Phoenix.HTML.SimplifiedHelpers.TimeAgoInWordsTest do
  use ExUnit.Case
  use Phoenix.HTML.SimplifiedHelpers

  doctest Phoenix.HTML.SimplifiedHelpers

  test "time_ago_in_words normally" do
    assert time_ago_in_words(Timex.Date.now) == "less than 5 seconds"
  end

  test "time_ago_in_words epoch" do
    assert time_ago_in_words(Timex.Date.now(:secs)) == "less than 5 seconds"
  end

  test "time_ago_in_words with ecto" do
    assert time_ago_in_words(Ecto.DateTime.utc) == "less than 5 seconds"
  end

end
