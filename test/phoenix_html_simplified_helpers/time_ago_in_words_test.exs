Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Phoenix.HTML.SimplifiedHelpers.TimeAgoInWordsTest do
  use ExUnit.Case
  use Phoenix.HTML.SimplifiedHelpers

  doctest Phoenix.HTML.SimplifiedHelpers

  test "time_ago_in_words normally" do
    assert time_ago_in_words(Timex.DateTime.now) == "less than 5 seconds"
  end

  test "time_ago_in_words epoch" do
    assert time_ago_in_words(Timex.DateTime.now(:seconds)) == "less than 5 seconds"
  end

  test "time_ago_in_words with ecto" do
    assert time_ago_in_words(Ecto.DateTime.utc) == "less than 5 seconds"
  end

  test "time_ago_in_words normally in English" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
    assert time_ago_in_words(Timex.DateTime.now) == "less than 5 seconds"
  end

  test "time_ago_in_words epoch in English" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
    assert time_ago_in_words(Timex.DateTime.now(:seconds)) == "less than 5 seconds"
  end

  test "time_ago_in_words with ecto in English" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
    assert time_ago_in_words(Ecto.DateTime.utc) == "less than 5 seconds"
  end

  test "time_ago_in_words normally in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    assert time_ago_in_words(Timex.DateTime.now) == "5秒以内"
  end

  test "time_ago_in_words epoch in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    assert time_ago_in_words(Timex.DateTime.now(:seconds)) == "5秒以内"
  end

  test "time_ago_in_words with ecto in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    assert time_ago_in_words(Ecto.DateTime.utc) == "5秒以内"
  end

  test "time_ago_in_words normally in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    assert time_ago_in_words(Timex.DateTime.now) == "menos de 5 segundos"
  end

  test "time_ago_in_words epoch in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    assert time_ago_in_words(Timex.DateTime.now(:seconds)) == "menos de 5 segundos"
  end

  test "time_ago_in_words with ecto in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    assert time_ago_in_words(Ecto.DateTime.utc) == "menos de 5 segundos"
  end

  test "distance_of_time_in_words advance one month" do
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, months: 1)
    assert distance_of_time_in_words(from, to) == "about 1 months"
  end

  test "distance_of_time_in_words advance one month and half a month" do
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, days: 45)
    assert distance_of_time_in_words(from, to) == "about 2 months"
  end

  test "distance_of_time_in_words advance one year" do
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, years: 1)
    assert distance_of_time_in_words(from, to) == "about 1 year"
  end

  test "distance_of_time_in_words advance 2 years" do
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, years: 2)
    assert distance_of_time_in_words(from, to) == "about 2 years"
  end

  test "distance_of_time_in_words advance 1 year and half a year" do
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, months: 18)
    assert distance_of_time_in_words(from, to) == "over 1 year"
  end

  test "distance_of_time_in_words advance one month in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, months: 1)
    assert distance_of_time_in_words(from, to) == "約1ヶ月"
  end

  test "distance_of_time_in_words advance one month and half a month in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, days: 45)
    assert distance_of_time_in_words(from, to) == "約2ヶ月"
  end

  test "distance_of_time_in_words advance one year in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, years: 1)
    assert distance_of_time_in_words(from, to) == "約1年"
  end

  test "distance_of_time_in_words advance 2 years in Japanese" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, years: 2)
    assert distance_of_time_in_words(from, to) == "約2年"
  end

  test "distance_of_time_in_words advance 1 year and half a year in Español" do
    Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
    from = Timex.DateTime.from({{2015, 10, 31}, {0, 0, 0}})
    to   = Timex.DateTime.shift(from, months: 18)
    assert distance_of_time_in_words(from, to) == "más de 1 año"
  end


end
