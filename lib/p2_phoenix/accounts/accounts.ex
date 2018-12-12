defmodule P2Phoenix.Accounts do
  	@moduledoc """
  		The Accounts context.
  	"""

  	import Ecto.Query, warn: false
  	alias P2Phoenix.Repo
  	alias P2Phoenix.Accounts.User

  	def list_users do
    	Repo.all(User)
  	end

  	def get_by_username(username) when is_nil(username) do
    	nil
  	end
  	def get_by_username(username) do
    	Repo.get_by(User, username: username)
  	end

  	def get_user!(id), do: Repo.get!(User, id)

  	def create_user(attrs \\ %{}) do
    	%User{}
    	|> User.changeset(attrs)
    	|> Repo.insert()
  	end

  	def update_user(%User{} = user, attrs) do
    	user
    	|> User.changeset(attrs)
    	|> Repo.update()
  	end

  	def delete_user(%User{} = user) do
    	Repo.delete(user)
  	end

  	def change_user(%User{} = user) do
    	User.changeset(user, %{})
  	end

end
