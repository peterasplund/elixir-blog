defmodule Blog.PageController do
	use Blog.Web, :controller

	alias Blog.Post

	def index(conn, _params) do
		posts = Repo.all(Post)
		render conn, "index.html", posts: posts, layout: {Blog.LayoutView, "page.html"}
	end

	def single(conn, %{"slug" => slug}) do
		case Repo.get_by(Post, slug: slug) do
			nil -> render conn, "404.html", layout: {Blog.LayoutView, "page.html"}
			record -> render conn, "single.html", post: record, layout: {Blog.LayoutView, "page.html"}
		end
	end
end
