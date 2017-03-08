defmodule Phoenix.HTML.SimplifiedHelpers.Mixfile do
  use Mix.Project

  @description """
  Some view helpers for phoenix html( truncate, time_ago_in_words, number_with_delimiter, url_for, current_page? )
  """

  def project do
    [app: :phoenix_html_simplified_helpers,
     version: "1.1.1",
     elixir: ">= 1.3.0",
     source_url: "https://github.com/ikeikeikeike/phoenix_html_simplified_helpers",
     compilers: [:gettext] ++ Mix.compilers,
     docs: [extras: ["README.md"]],
     description: @description,
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :timex, :tzdata, :gettext]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:timex, "~> 3.1"},
      {:timex_ecto, "~> 3.1"},
      {:ecto, "~> 2.1"},
      {:gettext, "~> 0.11"},
      {:phoenix, "~> 1.2", only: :test},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, "~> 0.10", only: :dev},
      {:inch_ex, only: :docs},
    ]
  end

  defp package do
    [ maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ikeikeikeike/phoenix_html_simplified_helpers"},
    ]
  end

end
