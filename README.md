# PhoenixHtmlSimplifiedHelpers

[![Build Status](http://img.shields.io/travis/ikeikeikeike/phoenix_html_simplified_helpers.svg?style=flat-square)](http://travis-ci.org/ikeikeikeike/phoenix_html_simplified_helpers)
[![Hex version](https://img.shields.io/hexpm/v/phoenix_html_simplified_helpers.svg "Hex version")](https://hex.pm/packages/phoenix_html_simplified_helpers)
[![Hex downloads](https://img.shields.io/hexpm/dt/phoenix_html_simplified_helpers.svg "Hex downloads")](https://hex.pm/packages/phoenix_html_simplified_helpers)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/ikeikeikeike/phoenix_html_simplified_helpers.svg)](https://beta.hexfaktor.org/github/ikeikeikeike/phoenix_html_simplified_helpers)
[![Inline docs](https://inch-ci.org/github/ikeikeikeike/phoenix_html_simplified_helpers.svg)](http://inch-ci.org/github/ikeikeikeike/phoenix_html_simplified_helpers)
[![hex.pm](https://img.shields.io/hexpm/l/ltsv.svg)](https://github.com/ikeikeikeike/phoenix_html_simplified_helpers/blob/master/LICENSE)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add phoenix_html_simplified_helpers to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:phoenix_html_simplified_helpers, "~> x.x.x"}]
  end
  ```

  2. Ensure phoenix_html_simplified_helpers is started before your application:

  ```elixir
  def application do
    [applications: [:phoenix_html_simplified_helpers]]
  end
  ```

  3. phoenix_html_simplified_helpers need to import(use) your Phoenix project. The following description is adding 'use syntax' into web.ex.

  ```elixir
  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML
      use Phoenix.HTML.SimplifiedHelpers  # <- this line.

      import MyApp.Router.Helpers
      import MyApp.ErrorHelpers
      import MyApp.Gettext
    end
  end
  ```

  It is also able to import(use) in each view helper files.

  ```elixir
  defmodule MyApp.LayoutView do
    use MyApp.Web, :view
    import Phoenix.HTML.SimplifiedHelpers.Truncate        # <- this line.
    import Phoenix.HTML.SimplifiedHelpers.TimeAgoInWords  # <- this line.
  end
  ```

  4. time_ago_in_words has Gettext module that is changed translation file from project's locale.

  ```elixir
  Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
  Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
  Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
  ```


# Usage

## truncate

```elixir
<%= truncate entity.content %>
```
```elixir
truncate "Once upon a time in a world far far away"
# Once upon a time in a world...
truncate "Once upon a time in a world far far away", length: 27
# Once upon a time in a wo...
truncate "And they found that many people were sleeping better.", length: 25, omission: "... (continued)"
# And they f... (continued)
truncate("Once upon a time in a world far far away", length: 17, separator: " ")
# Once upon a...
```

## time_ago_in_words

```elixir
<%= time_ago_in_words entity.published_at %> ago
```

```elixir
time_ago_in_words Timex.Date.now
# less than 5 seconds
time_ago_in_words Timex.Date.now(:secs)
# less than 5 seconds
time_ago_in_words Ecto.DateTime.utc
# less than 5 seconds
```

### distance_of_time_in_words

```elixir
from = Timex.Date.from({{2015, 10, 31}, {0, 0, 0}})
to   = Timex.Date.shift(from, days: 45)
distance_of_time_in_words(from, to)
# about 2 months

Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "ja")
from = Timex.Date.from({{2015, 10, 31}, {0, 0, 0}})
to   = Timex.Date.shift(from, months: 1)
distance_of_time_in_words(from, to)
# 約1ヶ月

Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "es")
from = Timex.Date.from({{2015, 10, 31}, {0, 0, 0}})
to   = Timex.Date.shift(from, months: 18)
distance_of_time_in_words(from, to)
# más de 1 año
```

Or uses `Timex.format!("{relative}", :relative)` instead, like this.

```elixir
Timex.shift(datetime, hours: -3) |> Timex.format!("{relative}", :relative)
"3 hours ago"
```

## number_with_delimiter

```elixir
number_with_delimiter 1234567
# 1,234,567
```

## url_for

Routes setting is [Here](https://github.com/ikeikeikeike/phoenix_html_simplified_helpers/blob/master/test/test_helper.exs).

```elixir
url_for(conn, "home.index")
# /

url_for(conn, "entry.release:")
# /release/

url_for(conn, "entry.release:percent")
# /release/percent

url_for(conn, "entry.release:", some: "query")
# /release/?some=query

url_for(conn, "entry.release:", some: "query", unko: "query2")
# /release/?some=query&unko=query2
```

## current_page?

```elixir
conn = conn(:get, "/release/")

current_page?(conn, "entry.release:")
# true

current_page?(conn, "home.index")
# false
