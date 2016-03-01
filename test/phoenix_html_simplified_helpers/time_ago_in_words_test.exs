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

  test "time_ago_in_words normally in English" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
    assert time_ago_in_words(Timex.Date.now) == "less than 5 seconds"
  end

  test "time_ago_in_words epoch in English" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
    assert time_ago_in_words(Timex.Date.now(:secs)) == "less than 5 seconds"
  end

  test "time_ago_in_words with ecto in English" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
    assert time_ago_in_words(Ecto.DateTime.utc) == "less than 5 seconds"
  end

  test "time_ago_in_words normally in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    assert time_ago_in_words(Timex.Date.now) == "5秒以内"
  end

  test "time_ago_in_words epoch in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    assert time_ago_in_words(Timex.Date.now(:secs)) == "5秒以内"
  end

  test "time_ago_in_words with ecto in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    assert time_ago_in_words(Ecto.DateTime.utc) == "5秒以内"
  end

  test "time_ago_in_words normally in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    assert time_ago_in_words(Timex.Date.now) == "menos de 5 segundos"
  end

  test "time_ago_in_words epoch in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    assert time_ago_in_words(Timex.Date.now(:secs)) == "menos de 5 segundos"
  end

  test "time_ago_in_words with ecto in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    assert time_ago_in_words(Ecto.DateTime.utc) == "menos de 5 segundos"
  end

end
