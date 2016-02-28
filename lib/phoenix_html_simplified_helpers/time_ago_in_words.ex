defmodule Phoenix.HTML.SimplifiedHelpers.TimeAgoInWords do
  import  Phoenix.HTML.SimplifiedHelpers.Gettext

  @minutes_in_year 525600
  @minutes_in_quarter_year 131400
  @minutes_in_three_quarters_year 394200

  def time_ago_in_words(from_time) do
    distance_of_time_in_words(from_time, Timex.Time.now(:secs))
  end

  def distance_of_time_in_words_to_now(from_time) do
    time_ago_in_words(from_time)
  end

  def distance_of_time_in_words(%Ecto.DateTime{} = from_time) do
    {:ok, from} = Timex.Ecto.DateTime.cast from_time
    distance_of_time_in_words(Timex.Date.to_secs(from), Timex.Time.now(:secs))
  end

  def distance_of_time_in_words(%Timex.DateTime{} = from_time) do
    distance_of_time_in_words(Timex.Date.to_secs(from_time), Timex.Time.now(:secs))
  end

  def distance_of_time_in_words(from_time) when is_integer(from_time), do: distance_of_time_in_words(from_time, 0)

  def distance_of_time_in_words(%Ecto.DateTime{} = from_time, to_time) when is_integer(to_time) do
    {:ok, from} = Timex.Ecto.DateTime.cast from_time
    distance_of_time_in_words(Timex.Date.to_secs(from), to_time)
  end

  def distance_of_time_in_words(%Ecto.DateTime{} = from_time, %Ecto.DateTime{} = to_time) do
    {:ok, from} = Timex.Ecto.DateTime.cast from_time
    {:ok, to}   = Timex.Ecto.DateTime.cast to_time
    distance_of_time_in_words(Timex.Date.to_secs(from), Timex.Date.to_secs(to))
  end

  def distance_of_time_in_words(%Timex.DateTime{} = from_time, %Timex.DateTime{} = to_time) do
    distance_of_time_in_words(Timex.Date.to_secs(from_time), Timex.Date.to_secs(to_time))
  end

  @spec distance_of_time_in_words(Integer.t, Integer.t) :: String.t
  def distance_of_time_in_words(from_time, to_time) when is_integer(from_time) and is_integer(to_time) do
    if from_time > to_time do
      from_time = to_time
      to_time = from_time
    end

    distance_in_minutes = round((to_time - from_time) / 60.0)
    distance_in_seconds = round(to_time - from_time)

    case distance_in_minutes do
      x when x in 0..1          ->
        case distance_in_seconds do
          x when x in 0..4      -> gettext "less than %{count} seconds", count: 5
          x when x in 5..9      -> gettext "less than %{count} seconds", count: 10
          x when x in 10..19    -> gettext "less than %{count} seconds", count: 20
          x when x in 20..39    -> gettext "half a minute"
          x when x in 40..59    -> gettext "less than %{count} minute",  count: 1
          _                     -> gettext "%{count} minute",            count: 1
        end
      x when x in 2..44         -> gettext "%{count} minutes",           count: distance_in_minutes
      x when x in 45..89        -> gettext "about %{count} hour",        count: 1
      # 90 mins up to 24 hours
      x when x in 90..1439      -> gettext "about %{count} hours",       count: round(distance_in_minutes / 60.0)
      # 24 hours up to 42 hours
      x when x in 1440..2519    -> gettext "%{count} day",               count: 1
      # 42 hours up to 30 days
      x when x in 2520..43199   -> gettext "%{count} days",              count: round(distance_in_minutes / 1440.0)
      # 30 days up to 60 days
      x when x in 43200..86399  -> gettext "about %{count} months",      count: round(distance_in_minutes / 43200.0)
      # 60 days up to 365 days
      x when x in 86400..525599 -> gettext "%{count} months",            count: round(distance_in_minutes / 43200.0)
      _                         ->
        remainder                = rem distance_in_minutes, @minutes_in_year
        distance_in_years        = div distance_in_minutes, @minutes_in_year

        cond do
          remainder < @minutes_in_quarter_year ->
            case distance_in_years do
              1                 -> gettext "about %{count} year",        count: distance_in_years
              _                 -> gettext "about %{count} years",       count: distance_in_years
            end
          remainder < @minutes_in_three_quarters_year ->
            case distance_in_years do
              1                 -> gettext "over %{count} year",         count: distance_in_years
              _                 -> gettext "over %{count} years",        count: distance_in_years
            end
          true ->
            case distance_in_years do
              1                 -> gettext "almost %{count} year",       count: distance_in_years + 1
              _                 -> gettext "almost %{count} years",      count: distance_in_years + 1
            end
        end
    end
  end
end
