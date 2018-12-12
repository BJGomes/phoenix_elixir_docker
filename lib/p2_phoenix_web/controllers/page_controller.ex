defmodule P2PhoenixWeb.PageController do
  use P2PhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
