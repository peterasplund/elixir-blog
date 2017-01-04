defmodule Blog.Session do
  alias Blog.User

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp hash(pw) do
    :crypto.hash(:sha256, pw) |> Base.encode16
  end

  defp checkpw(pw1, pw2) do
    hash(pw1) == hash(pw2)
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> checkpw(hash(password), user.crypted_password)
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Blog.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)
end
