Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Phoenix.HTML.SimplifiedHelpers.URLTest do
  alias Phoenix.HTML.SimplifiedHelpers

  use ExUnit.Case
  use Plug.Test
  use SimplifiedHelpers

  import SimplifiedHelpers

  doctest SimplifiedHelpers

  @opts SimplifiedHelpers.Router.init([])

  test "url_for home" do
    conn = conn(:get, "/") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert "/" == url_for(conn, "home.index")
  end

  test "url_for entry" do
    conn = conn(:get, "/") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert "/release/" == url_for(conn, "entry.release:")
  end

  test "url_for with params" do
    conn = conn(:get, "/") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert "/release/percent" == url_for(conn, "entry.release:percent")
  end

  test "url_for with options" do
    conn = conn(:get, "/") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert "/release/?some=query" == url_for(conn, "entry.release:", some: "query")
  end

  test "url_for with options two" do
    conn = conn(:get, "/") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert "/release/?some=query&unko=query2" == url_for(conn, "entry.release:", some: "query", unko: "query2")
  end

  test "current_pate? one" do
    conn = conn(:get, "/release/?percent=oh+yes%21") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert true == current_page?(conn, "entry.release:", percent: "oh yes!")
  end

  test "current_pate? two" do
    conn = conn(:get, "/release/?unko1=1&unko2=3") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert false == current_page?(conn, "entry.release:", unko1: "1", unko2: "2")
  end

  test "current_pate? three" do
    conn = conn(:get, "/release/") |> Map.put(:private, %{phoenix_router: SimplifiedHelpers.Router})
    assert true == current_page?(conn, "entry.release:")
  end

end
