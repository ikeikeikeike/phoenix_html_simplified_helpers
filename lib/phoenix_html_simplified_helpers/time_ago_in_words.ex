defmodule Phoenix.HTML.SimplifiedHelpers.TimeAgoInWords do

  def time_ago_in_words(from_time), do:
    distance_of_time_in_words(from_time, Timex.Time.now(:secs))

  def distance_of_time_in_words_to_now(from_time), do:
    time_ago_in_words(from_time)

  def distance_of_time_in_words(%Ecto.DateTime{} = from_time) do
    {:ok, from} = Timex.Ecto.DateTime.cast from_time
    distance_of_time_in_words(Timex.Date.to_secs(from), Timex.Time.now(:secs))
  end

  def distance_of_time_in_words(%Ecto.DateTime{} = from_time, %Ecto.DateTime{} = to_time) do
    {:ok, from} = Timex.Ecto.DateTime.cast from_time
    {:ok, to}   = Timex.Ecto.DateTime.cast to_time
    distance_of_time_in_words(Timex.Date.to_secs(from), Timex.Date.to_secs(to))
  end

  # def distance_of_time_in_words(%Timex.DateTime{} = from_time), do:
    # distance_of_time_in_words(Timex.Date.to_secs(from_time), Timex.Time.now(:secs))

  # def distance_of_time_in_words(%Timex.DateTime{} = from_time, %Timex.DateTime{} = to_time), do:
    # distance_of_time_in_words(Timex.Date.to_secs(from_time), Timex.Date.to_secs(to_time))

  @spec distance_of_time_in_words(number, number) :: number
  def distance_of_time_in_words(from_time, to_time) do
    if from_time > to_time do
      from_time = to_time
      to_time = from_time
    end

    distance_in_minutes = round((to_time - from_time) / 60.0)
    distance_in_seconds = round(to_time - from_time)

    IO.inspect distance_in_minutes
    IO.inspect distance_in_seconds

    case distance_in_minutes do
      x when x in 0..1          -> 1
      x when x in 2..44         -> distance_in_minutes
      x when x in 45..89        -> 1
      # 90 mins up to 24 hours
      x when x in 90..1439      -> round(distance_in_minutes / 60.0)
      # 24 hours up to 42 hours
      x when x in 1440..2519    -> 1
      # 42 hours up to 30 days
      x when x in 2520..43199   -> round(distance_in_minutes / 1440.0)
      # 30 days up to 60 days
      x when x in 43200..86399  -> round(distance_in_minutes / 43200.0)
      # 60 days up to 365 days
      x when x in 86400..525599 -> round(distance_in_minutes / 43200.0)
      _ ->
        :error
    end

  end
end
