defmodule Blog.PageController do
	use Blog.Web, :controller

	alias Blog.Post

	def index(conn, _params) do
		posts = Repo.all(Post)
		render conn, "index.html", posts: posts, layout: {Blog.LayoutView, "page.html"}
	end

	def single(conn, %{"slug" => slug}) do
		post = Repo.get!(Post, slug)
		render conn, "single.html", post: post, layout: {Blog.LayoutView, "page.html"}
	end
end
