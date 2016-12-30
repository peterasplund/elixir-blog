defmodule Blog.AdminController do
	use Blog.Web, :controller

	def index(conn, _params) do
		render conn, "index.html", layout: {Blog.LayoutView, "admin.html"}
	end
end
