defmodule P2PhoenixWeb.UserController do
    use P2PhoenixWeb, :controller

    alias P2Phoenix.Accounts
    alias P2Phoenix.Accounts.User

    def new(conn, _params) do
        changeset = Accounts.change_user(%User{})
        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
        case Accounts.create_user(user_params) do
        {:ok, user} ->
            conn
            |> put_flash(:info, "User created successfully.")
            |> redirect(to: user_path(conn, :show, user))
        {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "new.html", changeset: changeset)
        end
    end

end
