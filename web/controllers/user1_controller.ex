
defmodule Rumbl.User1Controller do
  use Rumbl.Web, :controller
  alias Rumbl.User

  plug :authenticate when action in [:index, :show]

  def show(conn, %{"user" => user}) do
    # user = Repo.get(Rumbl.User, username)
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
