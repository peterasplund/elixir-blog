defmodule Blog.RegistrationController do
	use Blog.Web, :controller
	alias Blog.User

	def new(conn, _params) do
		changeset = User.changeset(%User{})
  	render conn, changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
	end

	def create(conn, %{"user" => user_params}) do
		changeset = User.changeset(%User{}, user_params)

		case Blog.Registration.create(changeset, Blog.Repo) do
			{:ok, changeset} ->
				conn
        |> put_session(:current_user, changeset.id)
				|> put_flash(:info, "Your account was created")
				|> redirect(to: "/")
			{:error, changeset} ->
			  conn
				|> put_flash(:info, "Unable to create account")
				|> render("new.html", changeset: changeset, layout: {Blog.LayoutView, "admin.html"})
		end
	end
end
