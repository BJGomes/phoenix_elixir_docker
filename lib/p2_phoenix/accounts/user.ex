defmodule P2Phoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias P2Phoenix.Accounts.User


  schema "users" do
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
  end
end
