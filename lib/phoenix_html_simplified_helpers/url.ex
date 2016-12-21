defmodule Phoenix.HTML.SimplifiedHelpers.URL do

  def url_for(conn, ctrl_act_param, opts \\ []) do
    [ctrl_act | params] = String.split(ctrl_act_param, ":")
    [ctrl, act] = String.split(ctrl_act, ".")

    helper =  Module.concat(conn.private.phoenix_router, Helpers)
    apply helper, :"#{ctrl}_path", [conn, :"#{act}"] ++ params ++ [opts]
  end

  def current_page?(conn, ctrl_act_param, opts \\ []) do
    left  = url_for(conn, ctrl_act_param, opts)
    right = to_string %URI{
      path: conn.request_path,
      query: if(conn.query_string != "", do: conn.query_string)
    }

    left == right
  end

end
