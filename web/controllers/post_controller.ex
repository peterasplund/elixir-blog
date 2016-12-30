import Blog.Helpers

defmodule Blog.PostController do
  use Blog.Web, :controller

  alias Blog.Post
  alias Blog.Category

  def index(conn, _params) do
    posts = Repo.all(Post)
    render conn, "index.html", posts: posts, layout: {Blog.LayoutView, "admin.html"}
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render conn, "new.html", changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, Map.merge(post_params, %{
      "slug" => slugify Map.get(post_params, "title")
    }))

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render conn, "show.html", post: post, layout: {Blog.LayoutView, "admin.html"}
  end

  def edit(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    categories = Repo.all(Category) |> Enum.map(&{&1.title, &1.id})
    changeset = Post.changeset(post)
    render conn, "edit.html", post: post, changeset: changeset, categories: categories, layout: {Blog.LayoutView, "admin.html"}
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post, Map.merge(post_params, %{
      "slug" => slugify Map.get(post_params, "title")
    }))

    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, changeset} ->
        render conn, "edit.html", post: post, changeset: changeset, layout: {Blog.LayoutView, "admin.html"}
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index))
  end
end
