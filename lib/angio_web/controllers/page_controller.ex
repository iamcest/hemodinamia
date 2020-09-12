defmodule AngioWeb.PageController do
  use AngioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
