
defmodule Rumbl.User1Controller do
  use Rumbl.Web, :controller

   plug :authenticate when action in [:show]

  def show(conn, %{"user" => user}) do
       render conn, "show.html", user: user
  end


  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
