# PhoenixHtmlSimplifiedHelpers

[![Build Status](http://img.shields.io/travis/ikeikeikeike/phoenix_html_simplified_helpers.svg?style=flat-square)](http://travis-ci.org/ikeikeikeike/phoenix_html_simplified_helpers)
[![Hex version](https://img.shields.io/hexpm/v/phoenix_html_simplified_helpers.svg "Hex version")](https://hex.pm/packages/phoenix_html_simplified_helpers)
[![Hex downloads](https://img.shields.io/hexpm/dt/phoenix_html_simplified_helpers.svg "Hex downloads")](https://hex.pm/packages/phoenix_html_simplified_helpers)
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
      use Phoenix.HTML.SimplifiedHelpers  # this line.

      import MyApp.Router.Helpers
      import MyApp.ErrorHelpers
      import MyApp.Gettext
    end
  end
  ```

  Also it is able to import(use) in each view helper files.

  ```elixir
  defmodule MyApp.LayoutView do
    use MyApp.Web, :view
    import Phoenix.HTML.SimplifiedHelpers.Truncate        # this line.
    import Phoenix.HTML.SimplifiedHelpers.TimeAgoInWords  # this line.
  end
  ```

  4. time_ago_in_words has Gettext module that is changed translation file from project's locale.

  ```elixir
  Gettext.put_locale(Phoenix.HTML.SimplifiedHelpers.Gettext, "en")
  ```


## Usage

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
```

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
