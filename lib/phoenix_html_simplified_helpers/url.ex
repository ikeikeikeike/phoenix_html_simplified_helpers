defmodule Phoenix.HTML.SimplifiedHelpers.URL do

  @doc """
  Generate URL

  # Example

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
  """
  def url_for(conn, ctrl_act_param, opts \\ []) do
    [ctrl_act | params] = String.split(ctrl_act_param, ":")
    [ctrl, act] = String.split(ctrl_act, ".")

    helper =  Module.concat(conn.private.phoenix_router, Helpers)
    apply helper, :"#{ctrl}_path", [conn, :"#{act}"] ++ params ++ [opts]
  end

  @doc """
  Make sure current URL

  # Example


      conn = conn(:get, "/release/")

      current_page?(conn, "entry.release:")
      # true

      current_page?(conn, "home.index")
      # false
  """
  def current_page?(conn, ctrl_act_param, opts \\ []) do
    left  = url_for(conn, ctrl_act_param, opts)
    right = to_string %URI{
      path: conn.request_path,
      query: if(conn.query_string != "", do: conn.query_string)
    }

    left == right
  end

end
